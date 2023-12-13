// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_new_password_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfirmNewPasswordController
    on ConfirmNewPasswordControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'ConfirmNewPasswordControllerBase.state', context: context);

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

  late final _$showTextPasswordAtom = Atom(
      name: 'ConfirmNewPasswordControllerBase.showTextPassword',
      context: context);

  @override
  bool get showTextPassword {
    _$showTextPasswordAtom.reportRead();
    return super.showTextPassword;
  }

  @override
  set showTextPassword(bool value) {
    _$showTextPasswordAtom.reportWrite(value, super.showTextPassword, () {
      super.showTextPassword = value;
    });
  }

  late final _$showTextConfirmPasswordAtom = Atom(
      name: 'ConfirmNewPasswordControllerBase.showTextConfirmPassword',
      context: context);

  @override
  bool get showTextConfirmPassword {
    _$showTextConfirmPasswordAtom.reportRead();
    return super.showTextConfirmPassword;
  }

  @override
  set showTextConfirmPassword(bool value) {
    _$showTextConfirmPasswordAtom
        .reportWrite(value, super.showTextConfirmPassword, () {
      super.showTextConfirmPassword = value;
    });
  }

  late final _$codeAtom =
      Atom(name: 'ConfirmNewPasswordControllerBase.code', context: context);

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
      name: 'ConfirmNewPasswordControllerBase.newPassword', context: context);

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
      name: 'ConfirmNewPasswordControllerBase.confirmPassword',
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

  late final _$ConfirmNewPasswordControllerBaseActionController =
      ActionController(
          name: 'ConfirmNewPasswordControllerBase', context: context);

  @override
  void setState(BasicState value) {
    final _$actionInfo = _$ConfirmNewPasswordControllerBaseActionController
        .startAction(name: 'ConfirmNewPasswordControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$ConfirmNewPasswordControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setShowTextPassword(bool value) {
    final _$actionInfo =
        _$ConfirmNewPasswordControllerBaseActionController.startAction(
            name: 'ConfirmNewPasswordControllerBase.setShowTextPassword');
    try {
      return super.setShowTextPassword(value);
    } finally {
      _$ConfirmNewPasswordControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setShowTextConfirmPassword(bool value) {
    final _$actionInfo =
        _$ConfirmNewPasswordControllerBaseActionController.startAction(
            name:
                'ConfirmNewPasswordControllerBase.setShowTextConfirmPassword');
    try {
      return super.setShowTextConfirmPassword(value);
    } finally {
      _$ConfirmNewPasswordControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCode(String value) {
    final _$actionInfo = _$ConfirmNewPasswordControllerBaseActionController
        .startAction(name: 'ConfirmNewPasswordControllerBase.setCode');
    try {
      return super.setCode(value);
    } finally {
      _$ConfirmNewPasswordControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setNewPassword(String value) {
    final _$actionInfo = _$ConfirmNewPasswordControllerBaseActionController
        .startAction(name: 'ConfirmNewPasswordControllerBase.setNewPassword');
    try {
      return super.setNewPassword(value);
    } finally {
      _$ConfirmNewPasswordControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo =
        _$ConfirmNewPasswordControllerBaseActionController.startAction(
            name: 'ConfirmNewPasswordControllerBase.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$ConfirmNewPasswordControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
showTextPassword: ${showTextPassword},
showTextConfirmPassword: ${showTextConfirmPassword},
code: ${code},
newPassword: ${newPassword},
confirmPassword: ${confirmPassword}
    ''';
  }
}
