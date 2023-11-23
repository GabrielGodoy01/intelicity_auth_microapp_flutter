// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on AuthControllerBase, Store {
  Computed<bool>? _$isLoggedComputed;

  @override
  bool get isLogged =>
      (_$isLoggedComputed ??= Computed<bool>(() => super.isLogged,
              name: 'AuthControllerBase.isLogged'))
          .value;

  late final _$userAtom =
      Atom(name: 'AuthControllerBase.user', context: context);

  @override
  LoggedUserInfo? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(LoggedUserInfo? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$AuthControllerBaseActionController =
      ActionController(name: 'AuthControllerBase', context: context);

  @override
  void setUser(LoggedUserInfo? value) {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isLogged: ${isLogged}
    ''';
  }
}
