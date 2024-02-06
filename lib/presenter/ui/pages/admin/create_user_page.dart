import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/domain/enum/role_enum.dart';
import 'package:intelicity_auth_microapp_flutter/generated/l10n.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/utils/validation_field.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/create_user_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/states/basic_state.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/landing_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/widgets/button_custom.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/widgets/drop_down_field_custom.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/widgets/text_field_custom.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_text_styles.dart';

class CreateUserPage extends StatelessWidget {
  const CreateUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateUserController controller = Modular.get();
    final formKey = GlobalKey<FormState>();
    return LandingPage(
      child: Form(
          key: formKey,
          child: Column(
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
                  hintText: S.of(context).name,
                  onChanged: controller.setName,
                  prefixIcon: Icons.person,
                  validation: ValidationFieldHelper.validateRequiredField,
                );
              }),
              const SizedBox(height: 16),
              Observer(builder: (_) {
                return TextFielCustom(
                  hintText: S.of(context).email,
                  onChanged: controller.setEmail,
                  prefixIcon: Icons.email,
                  validation: ValidationFieldHelper.validateRequiredField,
                );
              }),
              const SizedBox(height: 16),
              Observer(builder: (_) {
                return DropDownFieldWidget<RoleEnum>(
                  hintText: S.of(context).email,
                  onChanged: controller.setRole,
                  validation: ValidationFieldHelper.validateRole,
                  items: RoleEnum.values.toList().map((RoleEnum value) {
                    return DropdownMenuItem<RoleEnum>(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                );
              }),
              const SizedBox(height: 16),
              Observer(builder: (_) {
                return ButtonCustom(
                  text: S.of(context).register,
                  isLoading: controller.state is BasicLoadingState,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await controller.createUser();
                    }
                  },
                );
              }),
            ],
          )),
    );
  }
}
