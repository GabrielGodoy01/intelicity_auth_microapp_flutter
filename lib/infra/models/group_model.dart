import 'package:intelicity_auth_microapp_flutter/domain/enum/group_enum.dart';

class GroupModel {
  final GroupEnum groupName;
  bool isSelected;

  GroupModel({required this.groupName, required this.isSelected});
}
