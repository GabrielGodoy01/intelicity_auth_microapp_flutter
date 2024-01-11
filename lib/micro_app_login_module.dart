import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/amplify/amplifyconfiguration.dart';
import 'package:intelicity_auth_microapp_flutter/domain/enum/role_enum.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/confirm_new_password_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/confirm_reset_password.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/login_with_email_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/reset_password_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/micro_app_auth_module.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/confirm_reset_password_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/forgot_password_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/login_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/login_new_password_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/forgot_password_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/login_new_password_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/login_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/new_password_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/success_login_page.dart';

class MicroAppLoginModule extends Module {
  @override
  List<Module> get imports => [MicroAppAuthModule(amplifyconfig)];

  @override
  void binds(i) {
    i.addLazySingleton<LoginController>(LoginController.new);
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
    r.child(Modular.initialRoute, child: (context) => const LoginPage());
    r.child('/forgot-password/',
        child: (context) => const ForgotPasswordPage());
    r.child('/new-password/', child: (context) => const NewPasswordPage());
    r.child('/login-new-password/',
        child: (context) => const LoginNewPasswordPage());
    r.child('/logged/',
        child: (context) => SuccessLoginPage(
              role: r.args.data as RoleEnum,
            ));
  }
}
