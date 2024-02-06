import 'package:dio/dio.dart';
import 'package:intelicity_auth_microapp_flutter/shared/helpers/environments/environment_config.dart';

final baseOptions = BaseOptions(
  baseUrl: EnvironmentConfig.MSS_BASE_URL,
  connectTimeout: const Duration(seconds: 30),
  receiveTimeout: const Duration(seconds: 30),
);
