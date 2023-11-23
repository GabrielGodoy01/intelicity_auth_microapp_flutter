import 'package:intelicity_auth_microapp_flutter/infra/dtos/user_dto.dart';

abstract class IAuthDatasource {
  Future<UserDto> loginEmail({required String email, required String password});
  Future<void> logout();
  Future<UserDto?> getLoggedUser();
}
