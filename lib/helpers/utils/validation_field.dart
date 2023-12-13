import 'package:intelicity_auth_microapp_flutter/generated/l10n.dart';
import 'package:string_validator/string_validator.dart' as validator;

class ValidationFieldHelper {
  static String? validateEmail(String? email) {
    if (email == null) {
      return S.current.fieldRequired;
    } else if (!validator.isEmail(email)) {
      return S.current.fieldEmailInvalid;
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null) {
      return S.current.fieldRequired;
    } else if (password.isNotEmpty &&
        password.length > 7 &&
        password.contains(RegExp(r'[A-Z]')) &&
        password.contains(RegExp(r'[a-z]')) &&
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return S.current.fieldPasswordInvalid;
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? password, String? confirmPassword) {
    if (confirmPassword == null) {
      return S.current.fieldRequired;
    } else if (confirmPassword != password) {
      return S.current.fieldConfirmPasswordInvalid;
    }
    return null;
  }
}
