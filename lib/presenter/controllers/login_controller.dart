import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/core/auth_controller.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/login_with_email_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/functions/global_snackbar.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/states/basic_state.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final ILoginWithEmailUsecase _loginWithEmail;
  final Logger logger = Modular.get();
  final AuthController _authController;

  LoginControllerBase(this._loginWithEmail, this._authController) {
    logger.d('authController.isLogged: ${_authController.isLogged}');
    if (_authController.isLogged) Modular.to.navigate('/logged');
  }

  @observable
  BasicState state = BasicInitialState();

  @action
  void setState(BasicState value) => state = value;

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @observable
  bool passwordVisible = false;

  @action
  void changePasswordVisibility() => passwordVisible = !passwordVisible;

  Future<void> loginEmail() async {
    setState(BasicLoadingState());
    final result = await _loginWithEmail(email, password);
    setState(result.fold((e) {
      logger.e(e.message);
      GlobalSnackBar.error(e.message);
      return BasicErrorState(error: e);
    }, (user) {
      _authController.setUser(user);
      Modular.to.navigate('/logged');
      return BasicInitialState();
    }));
  }
}
