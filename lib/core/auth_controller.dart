import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/domain/entities/logged_user_info.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/get_logged_user_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/logout_usecase.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  final IGetLoggedUserUsecase _getLoggedUser;
  final ILogoutUsecase _logout;
  final Logger logger = Modular.get();

  @observable
  LoggedUserInfo? user;

  AuthControllerBase(this._getLoggedUser, this._logout);

  @computed
  bool get isLogged => user != null;

  @action
  void setUser(LoggedUserInfo? value) => user = value;

  Future<void> signOut() async {
    final result = await _logout();
    result.fold((l) {
      logger.d('error on logout: ${l.message}');
    }, (r) {
      setUser(null);
      logger.d('logout success: $user');
    });
  }

  Future<bool> checkLogin() async {
    final result = await _getLoggedUser();
    return result.fold<bool>((l) {
      logger.d('authController.isLogged: $isLogged');
      return false;
    }, (r) {
      setUser(r);
      logger.d('authController.isLogged: $isLogged');
      return true;
    });
  }
}
