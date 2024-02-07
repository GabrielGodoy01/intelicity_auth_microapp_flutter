import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/domain/enum/role_enum.dart';
import 'package:intelicity_auth_microapp_flutter/generated/l10n.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/landing_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/widgets/button_custom.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_text_styles.dart';

class SuccessLoginPage extends StatelessWidget {
  final RoleEnum role;
  final Function() onPressed;
  const SuccessLoginPage(
      {super.key, required this.role, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return LandingPage(
        child: Column(
      children: [
        Text(
          S.of(context).loginSuccess,
          style: AppTextStyles.headline1,
        ),
        const SizedBox(height: 8),
        ButtonCustom(
          onPressed: onPressed,
          text: S.of(context).goToHome,
        ),
        if (role != RoleEnum.USER) ...[
          const SizedBox(height: 8),
          ButtonCustom(
            onPressed: () {
              Modular.to.navigate('/admin/');
            },
            text: S.of(context).adminPage,
          ),
        ],
      ],
    ));
  }
}
