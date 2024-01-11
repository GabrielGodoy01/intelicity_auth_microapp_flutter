// ignore_for_file: constant_identifier_names

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
}
