import 'package:flutter/material.dart';
import 'package:intelicity_auth_microapp_flutter/domain/entities/user_info.dart';

class UpdateUserDialog extends StatelessWidget {
  final UserInfo user;
  const UpdateUserDialog({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Dialog();
  }
}
