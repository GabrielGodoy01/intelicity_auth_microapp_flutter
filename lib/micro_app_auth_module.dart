import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/core/auth_controller.dart';
import 'package:intelicity_auth_microapp_flutter/domain/repositories/auth_repository_interface.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/get_logged_user_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/logout_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/infra/datasource/auth_datasource_interface.dart';
import 'package:intelicity_auth_microapp_flutter/infra/repositories/auth_repository_impl.dart';
import 'package:intelicity_auth_microapp_flutter/shared/helpers/services/dio/dio_http_request.dart';
import 'package:intelicity_auth_microapp_flutter/shared/helpers/services/dio/options/base_options.dart';
import 'package:intelicity_auth_microapp_flutter/shared/helpers/services/http/http_request_interface.dart';
import 'package:logger/logger.dart';
import 'amplify/amplify_config.dart';
import 'external/datasources/cognito_datasource.dart';

class MicroAppAuthModule extends Module {
  MicroAppAuthModule(String amplifyconfig) {
    configureAmplify(amplifyconfig);
    Logger.level = Level.debug;
  }

  @override
  void exportedBinds(i) {
    i.addLazySingleton((i) => Dio(baseOptions));
    i.addLazySingleton<IHttpRequest>((i) => DioHttpRequest(dio: i()));
    i.addLazySingleton(AuthController.new);
    i.addLazySingleton(Logger.new);
    i.add<IAuthDatasource>(CognitoDatasource.new);
    i.addLazySingleton<IAuthRepository>(AuthRepositoryCognito.new);
    i.addLazySingleton<IGetLoggedUserUsecase>(GetLoggedUserImpl.new);
    i.addLazySingleton<ILogoutUsecase>(LogoutUsecaseImpl.new);
  }
}
