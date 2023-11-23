import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Modular.get();
    return const Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
