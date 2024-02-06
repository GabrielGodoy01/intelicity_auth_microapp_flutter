import 'package:intelicity_auth_microapp_flutter/domain/enum/role_enum.dart';

class UserInfo {
  final String email;
  final String name;
  final String sub;
  final RoleEnum role;
  final List<String> groups;

  UserInfo({
    required this.email,
    required this.name,
    required this.sub,
    required this.role,
    this.groups = const [],
  });
}
