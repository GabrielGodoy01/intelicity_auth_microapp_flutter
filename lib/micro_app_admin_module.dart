import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/amplify/amplifyconfiguration.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/admin_create_user_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/list_users_in_group_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/guards/admin_guard.dart';
import 'package:intelicity_auth_microapp_flutter/micro_app_auth_module.dart';
import 'package:intelicity_auth_microapp_flutter/micro_app_users_management_module.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/create_user_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/admin/create_user_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/admin/home_admin_page.dart';

class MicroAppAdminModule extends Module {
  @override
  List<Module> get imports => [MicroAppAuthModule(amplifyconfig)];

  @override
  void binds(i) {
    i.addLazySingleton<IAdminCreateUserUsecase>(AdminCreateUserUsecaseImpl.new);
    i.addLazySingleton<CreateUserController>(CreateUserController.new);

    i.addLazySingleton<IListUsersInGroupUsecase>(
        ListUsersInGroupUsecaseImpl.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute,
        child: (context) => const HomeAdminPage(), guards: [AdminGuard()]);
    r.child('/create-new-user/',
        child: (context) => const CreateUserPage(), guards: [AdminGuard()]);
    r.module('/users-management/',
        module: MicroAppUsersManagementModule(), guards: [AdminGuard()]);
  }
}
