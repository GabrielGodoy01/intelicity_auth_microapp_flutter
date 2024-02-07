// ignore_for_file: constant_identifier_names

import 'package:intelicity_auth_microapp_flutter/generated/l10n.dart';

enum RoleEnum {
  ADMIN,
  INTELICITY,
  USER;

  static RoleEnum stringToEnum(String role) {
    switch (role) {
      case 'ADMIN':
        return RoleEnum.ADMIN;
      case 'INTELICITY':
        return RoleEnum.INTELICITY;
      default:
        return RoleEnum.USER;
    }
  }

  static String typeName(RoleEnum role) {
    return S.current.roleSchema(role.name);
  }
}

extension RoleEnumExtension on RoleEnum {
  String get typeName {
    return S.current.roleSchema(toString());
  }
}
