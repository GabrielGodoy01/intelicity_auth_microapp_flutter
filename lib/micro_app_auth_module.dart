import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/core/auth_controller.dart';
import 'package:intelicity_auth_microapp_flutter/domain/repositories/auth_repository_interface.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/get_logged_user_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/login_with_email_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/infra/datasource/auth_datasource_interface.dart';
import 'package:intelicity_auth_microapp_flutter/infra/repositories/auth_repository_impl.dart';
import 'package:logger/logger.dart';
import 'amplify/amplify_config.dart';
import 'domain/usecases/logout.dart';
import 'external/datasources/cognito_datasource.dart';

class MicroAppAuthModule extends Module {
  MicroAppAuthModule() {
    configureAmplify();
    Logger.level = Level.debug;
  }

  @override
  void exportedBinds(i) {
    i.addLazySingleton(AuthController.new);
    i.addLazySingleton(Logger.new);
    i.addLazySingleton<IAuthDatasource>(CognitoDatasource.new);
    i.addLazySingleton<IAuthRepository>(AuthRepositoryImpl.new);
    i.addLazySingleton<IGetLoggedUserUsecase>(GetLoggedUserImpl.new);
    i.addLazySingleton<ILoginWithEmailUsecase>(LoginWithEmailImpl.new);
    i.addLazySingleton<ILogoutUsecase>(LogoutUsecaseImpl.new);
  }
}
