import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/utils/screen_helper.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_colors.dart';

class TextFielCustom extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final String? Function(String?)? validation;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  const TextFielCustom({
    super.key,
    required this.hintText,
    this.validation,
    this.inputFormatters,
    this.onChanged,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      textAlign: TextAlign.start,
      validator: validation,
      onChanged: onChanged,
      cursorColor: AppColors.primaryPurple,
      decoration: InputDecoration(
          fillColor: AppColors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          hintText: hintText,
          suffixIconColor: AppColors.primaryPurple,
          filled: true,
          prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red, width: 2)),
          errorStyle: TextStyle(
            color: AppColors.red,
            fontSize:
                ScreenHelper.width(context) < ScreenHelper.breakpointTablet
                    ? 14
                    : 16,
            height: 1,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.primaryPurple, width: 2))),
    );
  }
}
