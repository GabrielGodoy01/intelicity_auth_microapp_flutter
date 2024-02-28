import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/confirm_new_password_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/confirm_reset_password.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/login_with_email_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/reset_password_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/guards/login_guard.dart';
import 'package:intelicity_auth_microapp_flutter/micro_app_auth_module.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/confirm_reset_password_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/forgot_password_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/login_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/login_new_password_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/forgot_password_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/login_new_password_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/login_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/new_password_page.dart';

class MicroAppLoginModule extends Module {
  final String _amplifyconfig;

  MicroAppLoginModule(this._amplifyconfig);

  @override
  List<Module> get imports => [MicroAppAuthModule(_amplifyconfig)];

  @override
  void binds(i) {
    i.add<LoginController>(LoginController.new);
    i.addLazySingleton<ILoginWithEmailUsecase>(LoginWithEmailImpl.new);
    i.addLazySingleton<ForgotPasswordController>(ForgotPasswordController.new);
    i.addLazySingleton<IResetPasswordUsecase>(ResetPasswordImpl.new);
    i.addLazySingleton<ConfirmResetPasswordController>(
        ConfirmResetPasswordController.new);
    i.addLazySingleton<LoginNewPasswordController>(
        LoginNewPasswordController.new);
    i.addLazySingleton<IConfirmResetPasswordUsecase>(
        ConfirmResetPasswordUsecaseImpl.new);
    i.addLazySingleton<IConfirmNewPasswordUsecase>(
        ConfirmNewPasswordUsecaseImpl.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute,
        child: (context) => const LoginPage(), guards: [LoginGuard()]);
    r.child('/forgot-password/',
        child: (context) => const ForgotPasswordPage(), guards: [LoginGuard()]);
    r.child('/new-password/',
        child: (context) => const NewPasswordPage(), guards: [LoginGuard()]);
    r.child('/login-new-password/',
        child: (context) => const LoginNewPasswordPage(),
        guards: [LoginGuard()]);
  }
}
