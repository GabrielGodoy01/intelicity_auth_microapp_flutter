import 'package:flutter/material.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_colors.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_text_styles.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

abstract class GlobalSnackBar {
  static void error(String message) {
    rootScaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      backgroundColor: AppColors.red,
      width: 600,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      content: Text(
        message,
        style: AppTextStyles.headline3
            .copyWith(color: AppColors.white, fontWeight: FontWeight.normal),
      ),
    ));
  }

  static void success(String message) {
    rootScaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      backgroundColor: AppColors.white,
      width: 500,
      behavior: SnackBarBehavior.floating,
      content: Text(message,
          style: AppTextStyles.headline3
              .copyWith(color: AppColors.black, fontWeight: FontWeight.normal)),
    ));
  }
}
