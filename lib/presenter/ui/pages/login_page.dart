import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/generated/l10n.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/utils/validation_field.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/login_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/widgets/button_custom.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/widgets/text_field_custom.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Modular.get();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.1, 0.9],
            colors: [AppColors.primaryPurple, AppColors.secundaryPurple],
          ),
        ),
        child: Center(
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
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/intelicity_logo.png',
                        height: 200,
                      ),
                      TextFielCustom(
                        hintText: S.of(context).email,
                        onChanged: controller.setEmail,
                        prefixIcon: Icons.person,
                        validation: ValidationFieldHelper.validateEmail,
                      ),
                      const SizedBox(height: 16),
                      Observer(builder: (_) {
                        return TextFielCustom(
                            hintText: S.of(context).password,
                            onChanged: controller.setPassword,
                            prefixIcon: Icons.lock,
                            validation:
                                ValidationFieldHelper.validateRequiredField,
                            isPasswordField: true,
                            changePwdVisibility:
                                controller.changePasswordVisibility,
                            showPassword: controller.passwordVisible);
                      }),
                      const SizedBox(height: 16),
                      ButtonCustom(
                          text: 'Acessar',
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await controller.loginEmail();
                            }
                          })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
