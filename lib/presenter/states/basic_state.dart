import 'package:intelicity_auth_microapp_flutter/domain/errors/errors.dart';

abstract class BasicState {
  const BasicState();
}

class BasicInitialState extends BasicState {}

class LoginLoadingState extends BasicState {}

class BasicErrorState extends BasicState {
  final Failure error;

  const BasicErrorState({required this.error});
}
