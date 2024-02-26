import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/core/auth_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/landing_page.dart';

class ListGroupPage extends StatelessWidget {
  const ListGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Modular.get();
    return LandingPage(
      child: Wrap(
          children: authController.user!.groups
              .map((e) => InkWell(
                    onTap: () {
                      Modular.to
                          .pushNamed('./users-management/group/', arguments: e);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(e),
                    ),
                  ))
              .toList()),
    );
  }
}
