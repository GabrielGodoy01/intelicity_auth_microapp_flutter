import 'package:intelicity_auth_microapp_flutter/domain/entities/user_info.dart';
import 'package:intelicity_auth_microapp_flutter/domain/errors/errors.dart';

abstract class ManagementGroupState {
  const ManagementGroupState();
}

class ManagementGroupInitialState extends ManagementGroupState {}

class ManagementGroupLoadingState extends ManagementGroupState {}

class ManagementGroupErrorState extends ManagementGroupState {
  final Failure error;

  const ManagementGroupErrorState({required this.error});
}

class ManagementGroupSuccessState extends ManagementGroupState {
  final List<UserInfo> users;

  const ManagementGroupSuccessState({required this.users});
}
