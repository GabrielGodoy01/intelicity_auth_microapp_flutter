import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/core/auth_controller.dart';
import 'package:intelicity_auth_microapp_flutter/generated/l10n.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/landing_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/widgets/button_custom.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_text_styles.dart';

class HomeAdminPage extends StatelessWidget {
  final Function() onPressed;

  const HomeAdminPage({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Modular.get();
    return LandingPage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            S.of(context).managementPage,
            style: AppTextStyles.headline1,
          ),
          const SizedBox(height: 16),
          ButtonCustom(
            onPressed: onPressed,
            text: S.of(context).goToHome,
          ),
          const SizedBox(height: 8),
          ButtonCustom(
            text: S.of(context).manageUsers,
            isLoading: false,
            onPressed: () async {
              Modular.to.pushNamed('./users-management/');
            },
          ),
          const SizedBox(height: 8),
          ButtonCustom(
            text: S.of(context).registerUser,
            isLoading: false,
            onPressed: () async {
              Modular.to.pushNamed('./create-new-user/');
            },
          ),
          const SizedBox(height: 8),
          ButtonCustom(
            onPressed: () async {
              await authController.signOut();
              Modular.to.navigate('/');
            },
            text: S.of(context).logout,
          ),
        ],
      ),
    );
  }
}
