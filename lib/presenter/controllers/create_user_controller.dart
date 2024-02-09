import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/core/auth_controller.dart';
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
  var authController = Modular.get<AuthController>();
  final IAdminCreateUserUsecase _adminCreateUser;

  CreateUserControllerBase(this._adminCreateUser) {
    initGroups();
  }

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
  var groups = ObservableList<Map<String, dynamic>>().asObservable();

  @action
  void initGroups() {
    var newGroup = groups;
    for (var group in authController.user!.groups) {
      newGroup.add({
        "group": group,
        "isSelected": false,
      });
    }
    groups = newGroup;
  }

  @action
  void setGroup(int index) {
    var newGroup = groups;
    newGroup[index]['isSelected'] = !newGroup[index]['isSelected'];
    groups = newGroup;
    print(groups);
  }

  @computed
  List<String> get selectedGroups => groups
      .where((element) => element['isSelected'] == true)
      .map((e) => e['group'])
      .toList() as List<String>;

  @action
  void clearAll() {
    email = '';
    name = '';
    role = null;
    initGroups();
  }

  @observable
  BasicState state = BasicInitialState();

  @action
  void setState(BasicState value) => state = value;

  Future<void> createUser() async {
    setState(BasicLoadingState());
    final result = await _adminCreateUser(
        email: email, name: name, role: role!, groups: selectedGroups);
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
