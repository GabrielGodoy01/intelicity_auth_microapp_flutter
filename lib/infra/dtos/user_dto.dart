import 'package:intelicity_auth_microapp_flutter/domain/entities/user_info.dart';
import 'package:intelicity_auth_microapp_flutter/domain/enum/role_enum.dart';

class UserDto extends UserInfo {
  UserDto({
    required super.email,
    required super.sub,
    required super.name,
    required super.role,
    required super.groups,
  });

  factory UserDto.fromMap(Map<String, dynamic> json) {
    return UserDto(
      email: json['email'],
      sub: '123',
      name: json['name'],
      role:
          RoleEnum.values.firstWhere((element) => element.name == json['role']),
      groups: List<String>.from(json['groups']),
    );
  }

  static List<UserDto> fromMaps(List array) {
    return array.map((e) => UserDto.fromMap(e)).toList();
  }
}
