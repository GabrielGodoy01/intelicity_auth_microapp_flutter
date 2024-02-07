import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/generated/l10n.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/landing_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/widgets/button_custom.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_text_styles.dart';

class HomeAdminPage extends StatelessWidget {
  const HomeAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LandingPage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            S.of(context).managementPage,
            style: AppTextStyles.headline1,
          ),
          const SizedBox(height: 8),
          Text(
            S.of(context).moreFeaturesSoon,
            style: AppTextStyles.bodyText1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ButtonCustom(
            text: S.of(context).registerUser,
            isLoading: false,
            onPressed: () async {
              Modular.to.pushNamed('./create-new-user/');
            },
          ),
        ],
      ),
    );
  }
}
