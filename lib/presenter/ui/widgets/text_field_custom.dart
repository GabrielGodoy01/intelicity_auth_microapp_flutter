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
  final bool isPasswordField;
  final bool? showPassword;
  final Function()? changePwdVisibility;
  const TextFielCustom({
    super.key,
    required this.hintText,
    this.validation,
    this.inputFormatters,
    this.onChanged,
    this.prefixIcon,
    this.isPasswordField = false,
    this.showPassword,
    this.changePwdVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      textAlign: TextAlign.start,
      validator: validation,
      onChanged: onChanged,
      cursorColor: AppColors.primaryPurple,
      obscureText: showPassword != null ? !showPassword! : false,
      decoration: InputDecoration(
          fillColor: AppColors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          hintText: hintText,
          suffixIconColor: AppColors.primaryPurple,
          filled: true,
          semanticCounterText: '123',
          prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
          prefixIconColor: AppColors.primaryPurple,
          suffixIcon: isPasswordField
              ? InkWell(
                  onTap: () => changePwdVisibility!(),
                  child: Icon(
                    showPassword! ? Icons.visibility : Icons.visibility_off,
                    size: 20,
                  ),
                )
              : null,
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
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.gray, width: 2),
            borderRadius: BorderRadius.circular(12),
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
