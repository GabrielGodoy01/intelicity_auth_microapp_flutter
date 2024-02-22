import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/core/auth_controller.dart';

class AuthInterceptor extends Interceptor {
  final AuthController authController = Modular.get();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (authController.user != null) {
      options.headers['Authorization'] =
          'Bearer ${authController.user!.idToken}';
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    err.response?.statusCode == 401 ? Modular.to.navigate('/login') : null;
    return handler.next(err);
  }
}
