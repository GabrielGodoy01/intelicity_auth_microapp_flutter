import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/core/auth_controller.dart';
import 'package:intelicity_auth_microapp_flutter/domain/enum/group_enum.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/landing_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/widgets/button_custom.dart';

class ListGroupPage extends StatelessWidget {
  const ListGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Modular.get();
    return LandingPage(
      isBackButtonVisible: true,
      child: Wrap(
          children: authController.user!.groups
              .map((e) => ButtonCustom(
                  text: GroupEnum.typeName(e),
                  icon: Icons.login,
                  onPressed: () async {
                    Modular.to.pushNamed('./group', arguments: e.name);
                  }))
              .toList()),
    );
  }
}
