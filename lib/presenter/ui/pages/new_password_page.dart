import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/generated/l10n.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/utils/validation_field.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/confirm_new_password_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/landing_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/widgets/button_custom.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/widgets/text_field_custom.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_text_styles.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfirmNewPasswordController controller = Modular.get();
    final formKey = GlobalKey<FormState>();
    return LandingPage(
      child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                S.of(context).verifyEmail,
                style: AppTextStyles.headline1,
              ),
              const SizedBox(height: 8),
              Text(
                S.of(context).newPasswordPageText,
                style: AppTextStyles.bodyText1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Observer(builder: (_) {
                return TextFielCustom(
                  hintText: S.of(context).code,
                  onChanged: controller.setCode,
                  prefixIcon: Icons.vpn_key,
                  validation: ValidationFieldHelper.validateRequiredField,
                );
              }),
              Observer(builder: (_) {
                return TextFielCustom(
                  hintText: S.of(context).newPassword,
                  onChanged: controller.setNewPassword,
                  prefixIcon: Icons.lock,
                  validation: ValidationFieldHelper.validatePassword,
                  isPasswordField: true,
                  changePwdVisibility: controller.changePasswordVisibility,
                  showPassword: controller.passwordVisible,
                );
              }),
              const SizedBox(height: 16),
              Observer(builder: (_) {
                return TextFielCustom(
                  hintText: S.of(context).confirmNewPassword,
                  onChanged: controller.setConfirmPassword,
                  prefixIcon: Icons.lock,
                  validation: ValidationFieldHelper.validateRequiredField,
                  isPasswordField: true,
                  changePwdVisibility:
                      controller.changeConfirmPasswordVisibility,
                  showPassword: controller.confirmPasswordVisible,
                );
              }),
              const SizedBox(height: 16),
              ButtonCustom(
                text: S.of(context).send,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await controller.confirmNewPassword();
                  }
                },
              ),
            ],
          )),
    );
  }
}
