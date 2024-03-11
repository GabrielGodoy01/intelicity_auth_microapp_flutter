import 'package:flutter/material.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_colors.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_text_styles.dart';

class ButtonCustom extends StatelessWidget {
  final Function() onPressed;
  final bool isLoading;
  final String text;
  final IconData? icon;
  const ButtonCustom({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryBlue),
        onPressed: onPressed,
        child: isLoading
            ? CircularProgressIndicator(color: AppColors.white)
            : icon == null
                ? Text(
                    text,
                    style: AppTextStyles.headline2
                        .copyWith(color: AppColors.white),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        color: AppColors.white,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        text,
                        style: AppTextStyles.headline2
                            .copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
      ),
    );
  }
}
