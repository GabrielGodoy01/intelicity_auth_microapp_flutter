import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/amplify/amplifyconfiguration.dart';
import 'package:intelicity_auth_microapp_flutter/domain/enum/role_enum.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/guards/admin_guard.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/guards/auth_guard.dart';
import 'package:intelicity_auth_microapp_flutter/micro_app_admin_module.dart';
import 'package:intelicity_auth_microapp_flutter/micro_app_auth_module.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/success_login_page.dart';

class MicroAppLoginModule extends Module {
  @override
  List<Module> get imports => [MicroAppAuthModule(amplifyconfig)];

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(Modular.initialRoute,
        child: (context) => SuccessLoginPage(
              role: r.args.data[0] as RoleEnum,
              onPressed: r.args.data[1] as Function(),
            ),
        guards: [AuthGuard()]);
    r.module('/admin/', module: MicroAppAdminModule(), guards: [AdminGuard()]);
  }
}
