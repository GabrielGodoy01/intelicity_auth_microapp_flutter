// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateUserController on CreateUserControllerBase, Store {
  Computed<List<String>>? _$selectedGroupsComputed;

  @override
  List<String> get selectedGroups => (_$selectedGroupsComputed ??=
          Computed<List<String>>(() => super.selectedGroups,
              name: 'CreateUserControllerBase.selectedGroups'))
      .value;

  late final _$emailAtom =
      Atom(name: 'CreateUserControllerBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$nameAtom =
      Atom(name: 'CreateUserControllerBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$roleAtom =
      Atom(name: 'CreateUserControllerBase.role', context: context);

  @override
  RoleEnum? get role {
    _$roleAtom.reportRead();
    return super.role;
  }

  @override
  set role(RoleEnum? value) {
    _$roleAtom.reportWrite(value, super.role, () {
      super.role = value;
    });
  }

  late final _$groupsAtom =
      Atom(name: 'CreateUserControllerBase.groups', context: context);

  @override
  List<GroupModel> get groups {
    _$groupsAtom.reportRead();
    return super.groups;
  }

  @override
  set groups(List<GroupModel> value) {
    _$groupsAtom.reportWrite(value, super.groups, () {
      super.groups = value;
    });
  }

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
  void setEmail(String value) {
    final _$actionInfo = _$CreateUserControllerBaseActionController.startAction(
        name: 'CreateUserControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$CreateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$CreateUserControllerBaseActionController.startAction(
        name: 'CreateUserControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$CreateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRole(RoleEnum? value) {
    final _$actionInfo = _$CreateUserControllerBaseActionController.startAction(
        name: 'CreateUserControllerBase.setRole');
    try {
      return super.setRole(value);
    } finally {
      _$CreateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initGroups() {
    final _$actionInfo = _$CreateUserControllerBaseActionController.startAction(
        name: 'CreateUserControllerBase.initGroups');
    try {
      return super.initGroups();
    } finally {
      _$CreateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGroup(int index) {
    final _$actionInfo = _$CreateUserControllerBaseActionController.startAction(
        name: 'CreateUserControllerBase.setGroup');
    try {
      return super.setGroup(index);
    } finally {
      _$CreateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearAll() {
    final _$actionInfo = _$CreateUserControllerBaseActionController.startAction(
        name: 'CreateUserControllerBase.clearAll');
    try {
      return super.clearAll();
    } finally {
      _$CreateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
email: ${email},
name: ${name},
role: ${role},
groups: ${groups},
state: ${state},
selectedGroups: ${selectedGroups}
    ''';
  }
}
