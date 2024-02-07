import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/domain/enum/role_enum.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/admin_create_user_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/generated/l10n.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/functions/global_snackbar.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/states/basic_state.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'create_user_controller.g.dart';

class CreateUserController = CreateUserControllerBase
    with _$CreateUserController;

abstract class CreateUserControllerBase with Store {
  final Logger logger = Modular.get();
  final IAdminCreateUserUsecase _adminCreateUser;

  CreateUserControllerBase(this._adminCreateUser);

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @observable
  String name = '';

  @action
  void setName(String value) => name = value;

  @observable
  RoleEnum? role;

  @action
  void setRole(RoleEnum? value) => role = value;

  @observable
  List<String> groups = [];

  @action
  void addGroup(String value) {
    List<String> newGroup = List.from(groups)..add(value);
    groups = newGroup;
  }

  @action
  void removeGroup(String value) {
    List<String> newGroup = List.from(groups)..remove(value);
    groups = newGroup;
  }

  @action
  void clearAll() {
    email = '';
    name = '';
    role = null;
    groups = [];
  }

  @action
  bool isInGroup(String group) {
    return groups.contains(group);
  }

  @observable
  BasicState state = BasicInitialState();

  @action
  void setState(BasicState value) => state = value;

  Future<void> createUser() async {
    setState(BasicLoadingState());
    final result = await _adminCreateUser(
        email: email, name: name, role: role!, groups: groups);
    setState(result.fold((e) {
      logger.e(e.message);
      GlobalSnackBar.error(e.message);
      return BasicErrorState(error: e);
    }, (_) {
      clearAll();
      GlobalSnackBar.success(S.current.createUserSuccess);
      return BasicInitialState();
    }));
  }
}
