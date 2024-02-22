import 'package:intelicity_auth_microapp_flutter/domain/usecases/list_users_in_group_usecase.dart';
import 'package:intelicity_auth_microapp_flutter/presenter/states/management_group_state.dart';
import 'package:mobx/mobx.dart';

part 'management_group_controller.g.dart';

class ManagementGroupController = ManagementGroupControllerBase
    with _$ManagementGroupController;

abstract class ManagementGroupControllerBase with Store {
  final IListUsersInGroupUsecase _listUsersInGroup;
  final String group;

  ManagementGroupControllerBase(this._listUsersInGroup, this.group) {
    getUsersInGroup();
  }

  @observable
  ManagementGroupState state = ManagementGroupInitialState();

  @action
  void setState(ManagementGroupState value) => state = value;

  @action
  Future<void> getUsersInGroup() async {
    setState(ManagementGroupLoadingState());
    final result = await _listUsersInGroup.call(group: group);
    result.fold(
      (error) => setState(ManagementGroupErrorState(error: error)),
      (users) => setState(ManagementGroupSuccessState(users: users)),
    );
  }
}
