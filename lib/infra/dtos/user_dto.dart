import 'package:intelicity_auth_microapp_flutter/domain/entities/user_info.dart';
import 'package:intelicity_auth_microapp_flutter/domain/enum/group_enum.dart';
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
      groups: (json['groups'] as List)
          .map((e) => GroupEnum.stringToEnum(e))
          .toList(),
    );
  }

  static List<UserDto> fromMaps(List array) {
    return array.map((e) => UserDto.fromMap(e)).toList();
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'sub': sub,
      'name': name,
      'role': role.name,
      'groups': groups,
    };
  }
}
