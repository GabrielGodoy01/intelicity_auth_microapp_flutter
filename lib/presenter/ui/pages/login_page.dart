import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/generated/l10n.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/utils/screen_helper.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/login_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/widgets/text_field_custom.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Modular.get();
    return Scaffold(
      backgroundColor: AppColors.primaryPurple,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 20,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/intelicity_logo.png'),
                    TextFielCustom(hintText: S.of(context).email),
                    const SizedBox(height: 16),
                    TextFielCustom(hintText: S.of(context).password),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
