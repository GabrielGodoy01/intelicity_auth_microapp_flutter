// ignore_for_file: constant_identifier_names

enum GroupEnum {
  GAIA,
  JUNDIAI;

  static GroupEnum stringToEnum(String group) {
    switch (group) {
      case 'GAIA':
        return GroupEnum.GAIA;
      default:
        return GroupEnum.JUNDIAI;
    }
  }

  static String typeName(GroupEnum group) {
    return group.name;
  }
}
