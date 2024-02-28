import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/resend_confirmation_code_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/reset_password_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/functions/global_snackbar.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/states/basic_state.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'forgot_password_controller.g.dart';

class ForgotPasswordController = ForgotPasswordControllerBase
    with _$ForgotPasswordController;

abstract class ForgotPasswordControllerBase with Store {
  final Logger logger = Modular.get();
  final IResetPasswordUsecase _resetPassword;
  final IResendConfirmationCodeUsecase _resendConfirmationCode;

  ForgotPasswordControllerBase(
      this._resetPassword, this._resendConfirmationCode);

  @observable
  BasicState state = BasicInitialState();

  @action
  void setState(BasicState value) => state = value;

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  Future<void> resetPassword() async {
    setState(BasicLoadingState());
    var result = await _resetPassword(email: email);
    setState(result.fold((e) {
      logger.e(e.message);
      GlobalSnackBar.error(e.message);
      return BasicErrorState(error: e);
    }, (user) {
      _resendConfirmationCode(email);
      Modular.to.pushNamed('/login/new-password', arguments: email);
      return BasicInitialState();
    }));
  }
}
