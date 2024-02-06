import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/admin_module.dart';
import 'package:intelicity_auth_microapp_flutter/amplify/amplifyconfiguration.dart';
import 'package:intelicity_auth_microapp_flutter/domain/enum/role_enum.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/admin_create_user_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/confirm_new_password_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/confirm_reset_password.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/list_users_in_group_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/login_with_email_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/reset_password_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/guards/admin_guard.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/guards/auth_guard.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/guards/login_guard.dart';
import 'package:intelicity_auth_microapp_flutter/micro_app_auth_module.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/confirm_reset_password_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/create_user_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/forgot_password_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/login_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/login_new_password_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/forgot_password_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/login_new_password_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/login_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/new_password_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/success_login_page.dart';
import 'package:intelicity_auth_microapp_flutter/shared/helpers/services/dio/auth_interceptor.dart';
import 'package:intelicity_auth_microapp_flutter/shared/helpers/services/dio/dio_http_request.dart';
import 'package:intelicity_auth_microapp_flutter/shared/helpers/services/dio/options/base_options.dart';
import 'package:intelicity_auth_microapp_flutter/shared/helpers/services/http/http_request_interface.dart';

class MicroAppLoginModule extends Module {
  @override
  List<Module> get imports => [MicroAppAuthModule(amplifyconfig)];

  @override
  void binds(i) {
    i.addLazySingleton(
        (i) => Dio(baseOptions)..interceptors.add(AuthInterceptor()));
    i.addLazySingleton<IHttpRequest>((i) => DioHttpRequest(dio: i<Dio>()));
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
    i.addLazySingleton<IAdminCreateUserUsecase>(AdminCreateUserUsecaseImpl.new);
    i.addLazySingleton<CreateUserController>(CreateUserController.new);

    i.addLazySingleton<IListUsersInGroupUsecase>(
        ListUsersInGroupUsecaseImpl.new);
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
    r.child('/logged/',
        child: (context) => SuccessLoginPage(
              role: r.args.data[0] as RoleEnum,
              onPressed: r.args.data[1] as Function(),
            ),
        guards: [AuthGuard()]);
    r.module('/admin/', module: AdminModule(), guards: [AdminGuard()]);
  }
}
