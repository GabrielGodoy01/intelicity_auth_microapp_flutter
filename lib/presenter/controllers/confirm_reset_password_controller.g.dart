// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_reset_password_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfirmResetPasswordController
    on ConfirmResetPasswordControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'ConfirmResetPasswordControllerBase.state', context: context);

  @override
  BasicState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(BasicState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$passwordVisibleAtom = Atom(
      name: 'ConfirmResetPasswordControllerBase.passwordVisible',
      context: context);

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.reportRead();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.reportWrite(value, super.passwordVisible, () {
      super.passwordVisible = value;
    });
  }

  late final _$confirmPasswordVisibleAtom = Atom(
      name: 'ConfirmResetPasswordControllerBase.confirmPasswordVisible',
      context: context);

  @override
  bool get confirmPasswordVisible {
    _$confirmPasswordVisibleAtom.reportRead();
    return super.confirmPasswordVisible;
  }

  @override
  set confirmPasswordVisible(bool value) {
    _$confirmPasswordVisibleAtom
        .reportWrite(value, super.confirmPasswordVisible, () {
      super.confirmPasswordVisible = value;
    });
  }

  late final _$codeAtom =
      Atom(name: 'ConfirmResetPasswordControllerBase.code', context: context);

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  late final _$newPasswordAtom = Atom(
      name: 'ConfirmResetPasswordControllerBase.newPassword', context: context);

  @override
  String get newPassword {
    _$newPasswordAtom.reportRead();
    return super.newPassword;
  }

  @override
  set newPassword(String value) {
    _$newPasswordAtom.reportWrite(value, super.newPassword, () {
      super.newPassword = value;
    });
  }

  late final _$confirmPasswordAtom = Atom(
      name: 'ConfirmResetPasswordControllerBase.confirmPassword',
      context: context);

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$ConfirmResetPasswordControllerBaseActionController =
      ActionController(
          name: 'ConfirmResetPasswordControllerBase', context: context);

  @override
  void setState(BasicState value) {
    final _$actionInfo = _$ConfirmResetPasswordControllerBaseActionController
        .startAction(name: 'ConfirmResetPasswordControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$ConfirmResetPasswordControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changePasswordVisibility() {
    final _$actionInfo =
        _$ConfirmResetPasswordControllerBaseActionController.startAction(
            name:
                'ConfirmResetPasswordControllerBase.changePasswordVisibility');
    try {
      return super.changePasswordVisibility();
    } finally {
      _$ConfirmResetPasswordControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeConfirmPasswordVisibility() {
    final _$actionInfo =
        _$ConfirmResetPasswordControllerBaseActionController.startAction(
            name:
                'ConfirmResetPasswordControllerBase.changeConfirmPasswordVisibility');
    try {
      return super.changeConfirmPasswordVisibility();
    } finally {
      _$ConfirmResetPasswordControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String? validateConfirmPassword(String? value) {
    final _$actionInfo =
        _$ConfirmResetPasswordControllerBaseActionController.startAction(
            name: 'ConfirmResetPasswordControllerBase.validateConfirmPassword');
    try {
      return super.validateConfirmPassword(value);
    } finally {
      _$ConfirmResetPasswordControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCode(String value) {
    final _$actionInfo = _$ConfirmResetPasswordControllerBaseActionController
        .startAction(name: 'ConfirmResetPasswordControllerBase.setCode');
    try {
      return super.setCode(value);
    } finally {
      _$ConfirmResetPasswordControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setNewPassword(String value) {
    final _$actionInfo = _$ConfirmResetPasswordControllerBaseActionController
        .startAction(name: 'ConfirmResetPasswordControllerBase.setNewPassword');
    try {
      return super.setNewPassword(value);
    } finally {
      _$ConfirmResetPasswordControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo =
        _$ConfirmResetPasswordControllerBaseActionController.startAction(
            name: 'ConfirmResetPasswordControllerBase.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$ConfirmResetPasswordControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
passwordVisible: ${passwordVisible},
confirmPasswordVisible: ${confirmPasswordVisible},
code: ${code},
newPassword: ${newPassword},
confirmPassword: ${confirmPassword}
    ''';
  }
}
