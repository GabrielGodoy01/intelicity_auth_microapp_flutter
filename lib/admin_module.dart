import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/guards/admin_guard.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/admin/create_user_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/admin/home_admin_page.dart';

class AdminModule extends Module {
  @override
  void routes(r) {
    r.child(Modular.initialRoute,
        child: (context) => const HomeAdminPage(), guards: [AdminGuard()]);
    r.child('/create-new-user/',
        child: (context) => const CreateUserPage(), guards: [AdminGuard()]);
  }
}
