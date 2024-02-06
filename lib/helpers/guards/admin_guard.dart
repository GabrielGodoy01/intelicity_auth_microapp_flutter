import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/core/auth_controller.dart';
import 'package:intelicity_auth_microapp_flutter/domain/enum/role_enum.dart';

class AdminGuard extends RouteGuard {
  AdminGuard({String? redirectTo}) : super(redirectTo: redirectTo ?? '/login');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    if (Modular.get<AuthController>().user == null) {
      return false;
    }
    return Modular.get<AuthController>().isLogged &&
        Modular.get<AuthController>().user!.role != RoleEnum.USER;
  }
}
