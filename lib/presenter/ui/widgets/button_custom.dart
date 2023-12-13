import 'package:flutter/material.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_colors.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_text_styles.dart';

class ButtonCustom extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const ButtonCustom({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(backgroundColor: AppColors.primaryPurple),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.login),
            const SizedBox(width: 16),
            Text(
              text,
              style: AppTextStyles.headline2.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
