import 'package:intelicity_auth_microapp_flutter/infra/dtos/user_dto.dart';

abstract class IAuthDatasource {
  Future<UserDto> loginEmail({required String email, required String password});
  Future<void> confirmNewPassword({required String newPassword});
  Future<void> logout();
  Future<UserDto?> getLoggedUser();
  Future<void> resetPassword({required String email});
  Future<void> confirmResetPassword(
      {required String email,
      required String code,
      required String newPassword});
}
