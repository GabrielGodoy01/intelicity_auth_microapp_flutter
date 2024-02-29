import 'package:intelicity_auth_microapp_flutter/domain/enum/role_enum.dart';
import 'package:intelicity_auth_microapp_flutter/generated/l10n.dart';
import 'package:string_validator/string_validator.dart' as validator;

class ValidationFieldHelper {
  static String? validateRequiredField(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.fieldRequired;
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return S.current.fieldRequired;
    } else if (!validator.isEmail(email)) {
      return S.current.fieldEmailInvalid;
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return S.current.fieldRequired;
    } else if (password.length < 8) {
      return 'A senha deve conter pelo menos 8 caracteres';
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return S.current.fieldRequired;
    } else if (confirmPassword != password) {
      return S.current.fieldConfirmPasswordInvalid;
    }
    return null;
  }

  static String? validateRole(RoleEnum? role) {
    if (role == null) {
      return S.current.fieldRequired;
    }
    return null;
  }
}
