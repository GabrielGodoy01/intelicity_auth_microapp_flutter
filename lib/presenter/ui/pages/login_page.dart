import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/generated/l10n.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/utils/validation_field.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/login_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/states/basic_state.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/landing_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/widgets/button_custom.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/widgets/text_field_custom.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_colors.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_text_styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Modular.get();
    final formKey = GlobalKey<FormState>();
    return LandingPage(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                  validation: ValidationFieldHelper.validateRequiredField,
                  isPasswordField: true,
                  changePwdVisibility: controller.changePasswordVisibility,
                  showPassword: controller.passwordVisible);
            }),
            const SizedBox(height: 16),
            Observer(builder: (_) {
              return ButtonCustom(
                  text: S.of(context).access,
                  isLoading: controller.state is BasicLoadingState,
                  icon: Icons.login,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await controller.loginEmail();
                    }
                  });
            }),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                Modular.to.navigate('/forgot-password');
              },
              child: Text(
                S.of(context).forgotPassword,
                style: AppTextStyles.headline3
                    .copyWith(color: AppColors.primaryPurple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
