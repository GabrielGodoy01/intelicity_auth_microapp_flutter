import 'package:intelicity_auth_microapp_flutter/domain/errors/errors.dart';

class AuthError extends Failure {
  AuthError({required String message}) : super(message: message);
}

class NewPasswordNecessaryError extends AuthError {
  NewPasswordNecessaryError() : super(message: 'Nova senha necessária');
}
