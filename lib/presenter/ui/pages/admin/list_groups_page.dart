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
          spacing: 8,
          runSpacing: 8,
          children: authController.user!.groups
              .map((e) => SizedBox(
                    width: 150,
                    child: ButtonCustom(
                        text: GroupEnum.typeName(e),
                        onPressed: () async {
                          Modular.to.pushNamed('./group', arguments: e.name);
                        }),
                  ))
              .toList()),
    );
  }
}
