import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/domain/repositories/auth_repository_interface.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/login_with_email_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/login_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/login_page.dart';

class MicroAppLoginModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<ILoginWithEmailUsecase>(
        LoginWithEmailImpl(i<IAuthRepository>()));
    i.addLazySingleton<LoginController>(LoginController.new);
  }

  @override
  void routes(r) {
    // r.child('/logged', child: (context) => LoggedPage(), guards: [AuthGuard()]);
    r.child('/', child: (context) => const LoginPage());
    // r.child('/forgot-password', child: (_, __) => const ForgotPasswordPage());
  }
}
