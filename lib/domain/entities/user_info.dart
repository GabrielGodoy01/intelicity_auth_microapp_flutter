import 'package:intelicity_auth_microapp_flutter/domain/enum/group_enum.dart';
import 'package:intelicity_auth_microapp_flutter/domain/enum/role_enum.dart';

class UserInfo {
  final String email;
  final String name;
  final String userId;
  final RoleEnum role;
  final List<GroupEnum> groups;

  UserInfo({
    required this.email,
    required this.name,
    required this.userId,
    required this.role,
    this.groups = const [],
  });
}
