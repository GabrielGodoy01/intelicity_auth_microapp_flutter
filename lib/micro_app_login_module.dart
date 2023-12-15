import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/domain/repositories/auth_repository_interface.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/confirm_new_password.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/login_with_email_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/reset_password_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/confirm_new_password_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/forgot_password_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/login_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/forgot_password_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/login_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/new_password_page.dart';

class MicroAppLoginModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<LoginController>(LoginController.new);
    i.addLazySingleton<ILoginWithEmailUsecase>(LoginWithEmailImpl.new);
    i.addLazySingleton<ForgotPasswordController>(ForgotPasswordController.new);
    i.addLazySingleton<IResetPasswordUsecase>(ResetPasswordImpl.new);
    i.addLazySingleton<ConfirmNewPasswordController>(
        ConfirmNewPasswordController.new);
    i.addLazySingleton<IConfirmNewPasswordUsecase>(
        ConfirmNewPasswordUsecaseImpl.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const LoginPage());
    r.child('/forgot-password/',
        child: (context) => const ForgotPasswordPage());
    r.child('/new-password/', child: (context) => const NewPasswordPage());
  }
}
