import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

abstract class Failure implements Exception {
  String get message;
}

class AuthError extends Failure {
  final Logger logger = Modular.get();
  AuthError({required this.message});

  @override
  final String message;
}
