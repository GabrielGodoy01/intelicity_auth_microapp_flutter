import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

abstract class GlobalSnackBar {
  static void error(String message) {
    rootScaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      // backgroundColor: AppColors.errorColor,
      behavior: SnackBarBehavior.floating,
      content: Text(message),
    ));
  }

  static void success(String message) {
    rootScaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      // backgroundColor: AppColors.mainBlueColor,
      behavior: SnackBarBehavior.floating,
      content: Text(message),
    ));
  }
}
