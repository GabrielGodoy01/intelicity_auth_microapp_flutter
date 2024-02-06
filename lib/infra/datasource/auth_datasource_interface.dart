import 'package:intelicity_auth_microapp_flutter/domain/enum/role_enum.dart';
import 'package:intelicity_auth_microapp_flutter/infra/dtos/logged_user_dto.dart';
import 'package:intelicity_auth_microapp_flutter/infra/dtos/user_dto.dart';

abstract class IAuthDatasource {
  Future<LoggedUserDto> loginEmail(
      {required String email, required String password});
  Future<void> confirmNewPassword({required String newPassword});
  Future<void> logout();
  Future<LoggedUserDto?> getLoggedUser();
  Future<void> resetPassword({required String email});
  Future<void> confirmResetPassword(
      {required String email,
      required String code,
      required String newPassword});
  Future<void> adminCreateUser({
    required String email,
    required String name,
    required RoleEnum role,
    required List<String> groups,
  });

  Future<List<UserDto>> getListUsersInGroup({required String group});
}
