import 'package:flutter/material.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/utils/screen_helper.dart';
import 'package:intelicity_auth_microapp_flutter/shared/themes/app_colors.dart';

class DropDownFieldWidget<T> extends StatelessWidget {
  final String hintText;
  final void Function(T? value)? onChanged;
  final String? Function(T?)? validation;
  final IconData? prefixIcon;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  const DropDownFieldWidget({
    Key? key,
    required this.hintText,
    this.value,
    this.onChanged,
    this.prefixIcon,
    required this.items,
    this.validation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<T>(
        icon: const Icon(
          Icons.keyboard_arrow_down,
          size: 28,
        ),
        value: value,
        onChanged: onChanged,
        items: items,
        validator: validation,
        decoration: InputDecoration(
            prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
            fillColor: AppColors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            hintText: hintText,
            suffixIconColor: AppColors.primaryPurple,
            filled: true,
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
      ),
    );
  }
}
