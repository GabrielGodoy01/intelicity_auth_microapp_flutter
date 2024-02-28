import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/admin_create_user_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/list_users_in_group_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/update_user_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/guards/admin_guard.dart';
import 'package:intelicity_auth_microapp_flutter/micro_app_auth_module.dart';
import 'package:intelicity_auth_microapp_flutter/micro_app_users_management_module.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/admin/create_user_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/admin/update_user_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/admin/create_user_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/admin/home_admin_page.dart';

class MicroAppAdminModule extends Module {
  final String _amplifyconfig;

  MicroAppAdminModule(this._amplifyconfig);

  @override
  List<Module> get imports => [MicroAppAuthModule(_amplifyconfig)];

  @override
  void binds(i) {
    i.addLazySingleton<IAdminCreateUserUsecase>(AdminCreateUserUsecaseImpl.new);
    i.addLazySingleton<CreateUserController>(CreateUserController.new);
    i.addLazySingleton<IUpdateUserUsecase>(UpdateUserUsecaseImpl.new);
    i.addLazySingleton<UpdateUserController>(UpdateUserController.new);

    i.addLazySingleton<IListUsersInGroupUsecase>(
        ListUsersInGroupUsecaseImpl.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute,
        child: (context) => HomeAdminPage(
              onPressed: r.args.data as Function(),
            ),
        guards: [AdminGuard()]);
    r.child('/create-new-user/',
        child: (context) => const CreateUserPage(), guards: [AdminGuard()]);
    r.module('/users-management/',
        module: MicroAppUsersManagementModule(_amplifyconfig),
        guards: [AdminGuard()]);
  }
}
