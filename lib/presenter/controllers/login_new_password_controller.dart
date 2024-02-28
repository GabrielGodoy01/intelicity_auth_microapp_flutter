import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/confirm_new_password_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/resend_confirmation_code_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/functions/global_snackbar.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/utils/validation_field.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/states/basic_state.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'login_new_password_controller.g.dart';

class LoginNewPasswordController = LoginNewPasswordControllerBase
    with _$LoginNewPasswordController;

abstract class LoginNewPasswordControllerBase with Store {
  final Logger logger = Modular.get();
  final IConfirmNewPasswordUsecase _confirmNewPassword;

  LoginNewPasswordControllerBase(this._confirmNewPassword);

  @observable
  BasicState state = BasicInitialState();

  @action
  void setState(BasicState value) => state = value;

  @observable
  bool passwordVisible = false;

  @action
  void changePasswordVisibility() => passwordVisible = !passwordVisible;

  @observable
  bool confirmPasswordVisible = false;

  @action
  void changeConfirmPasswordVisibility() =>
      confirmPasswordVisible = !confirmPasswordVisible;

  @action
  String? validateConfirmPassword(String? value) {
    return ValidationFieldHelper.validateConfirmPassword(
        newPassword, confirmPassword);
  }

  @observable
  String newPassword = '';

  @action
  void setNewPassword(String value) => newPassword = value;

  @observable
  String confirmPassword = '';

  @action
  void setConfirmPassword(String value) => confirmPassword = value;

  Future<void> confirmNewPassword() async {
    setState(BasicLoadingState());
    var result = await _confirmNewPassword(newPassword);
    setState(result.fold((e) {
      logger.e(e.message);
      GlobalSnackBar.error(e.message);
      return BasicErrorState(error: e);
    }, (_) {
      Modular.to.navigate('/');
      return BasicInitialState();
    }));
  }
}
