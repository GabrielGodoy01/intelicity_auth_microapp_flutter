import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/core/auth_controller.dart';
import 'package:intelicity_auth_microapp_flutter/domain/enum/role_enum.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/update_user_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/generated/l10n.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/functions/global_snackbar.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/states/basic_state.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'update_user_controller.g.dart';

class UpdateUserController = UpdateUserControllerBase
    with _$UpdateUserController;

abstract class UpdateUserControllerBase with Store {
  final Logger logger = Modular.get();
  var authController = Modular.get<AuthController>();

  final IUpdateUserUsecase _updateUser;

  UpdateUserControllerBase(this._updateUser);

  @observable
  BasicState state = BasicInitialState();

  @action
  void setState(BasicState value) => state = value;

  Future<void> updateUser(
    String email,
    String name,
    RoleEnum role,
    List<String> selectedGroups,
  ) async {
    setState(BasicLoadingState());
    final result = await _updateUser(
      email: email,
      name: name,
      role: role,
      groups: selectedGroups,
    );
    setState(result.fold((e) {
      logger.e(e.message);
      GlobalSnackBar.error(e.message);
      return BasicErrorState(error: e);
    }, (_) {
      GlobalSnackBar.success(S.current.updateUserSuccess);
      return BasicInitialState();
    }));
  }
}
