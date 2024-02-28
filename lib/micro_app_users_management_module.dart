import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/domain/usecases/list_users_in_group_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/helpers/guards/admin_guard.dart';
import 'package:intelicity_auth_microapp_flutter/micro_app_auth_module.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/controllers/admin/management_group_controller.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/admin/list_groups_page.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/ui/pages/admin/management_group_page.dart';

class MicroAppUsersManagementModule extends Module {
  final String _amplifyconfig;

  MicroAppUsersManagementModule(this._amplifyconfig);

  @override
  List<Module> get imports => [MicroAppAuthModule(_amplifyconfig)];

  @override
  void binds(i) {
    i.addLazySingleton<IListUsersInGroupUsecase>(
        ListUsersInGroupUsecaseImpl.new);
    i.addLazySingleton<ManagementGroupController>(
        ManagementGroupController.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute,
        child: (context) => const ListGroupPage(), guards: [AdminGuard()]);
    r.child('/group',
        child: (context) => const ManagementGroupPage(),
        guards: [AdminGuard()]);
  }
}
