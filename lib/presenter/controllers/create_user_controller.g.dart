// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateUserController on CreateUserControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'CreateUserControllerBase.state', context: context);

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

  late final _$CreateUserControllerBaseActionController =
      ActionController(name: 'CreateUserControllerBase', context: context);

  @override
  void setState(BasicState value) {
    final _$actionInfo = _$CreateUserControllerBaseActionController.startAction(
        name: 'CreateUserControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$CreateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
