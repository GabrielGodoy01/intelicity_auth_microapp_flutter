import 'package:intelicity_auth_microapp_flutter/domain/errors/errors.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  final Failure error;

  const LoginErrorState({required this.error});
}
