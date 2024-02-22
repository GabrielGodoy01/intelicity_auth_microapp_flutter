// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'management_group_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ManagementGroupController on ManagementGroupControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'ManagementGroupControllerBase.state', context: context);

  @override
  ManagementGroupState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ManagementGroupState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$getUsersInGroupAsyncAction = AsyncAction(
      'ManagementGroupControllerBase.getUsersInGroup',
      context: context);

  @override
  Future<void> getUsersInGroup() {
    return _$getUsersInGroupAsyncAction.run(() => super.getUsersInGroup());
  }

  late final _$ManagementGroupControllerBaseActionController =
      ActionController(name: 'ManagementGroupControllerBase', context: context);

  @override
  void setState(ManagementGroupState value) {
    final _$actionInfo = _$ManagementGroupControllerBaseActionController
        .startAction(name: 'ManagementGroupControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$ManagementGroupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
