import 'package:intelicity_auth_microapp_flutter/domain/entities/logged_user_info.dart';

class UserDto extends LoggedUserInfo {
  UserDto({
    required super.email,
    required super.sub,
    required super.accessToken,
    required super.name,
    required super.refreshToken,
    required super.idToken,
    required super.role,
    super.groups = const [],
  });
}
