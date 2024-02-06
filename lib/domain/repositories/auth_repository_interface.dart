import 'package:dartz/dartz.dart';
import 'package:intelicity_auth_microapp_flutter/domain/entities/logged_user_info.dart';
import 'package:intelicity_auth_microapp_flutter/domain/entities/user_info.dart';
import 'package:intelicity_auth_microapp_flutter/domain/enum/role_enum.dart';
import 'package:intelicity_auth_microapp_flutter/domain/errors/errors.dart';

abstract class IAuthRepository {
  Future<Either<Failure, LoggedUserInfo>> loginEmail(
      {required String email, required String password});
  Future<Either<Failure, Unit>> confirmNewPassword(
      {required String newPassword});
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, LoggedUserInfo>> getLoggedUser();
  Future<Either<Failure, Unit>> resetPassword({required String email});
  Future<Either<Failure, Unit>> confirmResetPassword(
      {required String email,
      required String code,
      required String newPassword});
  Future<Either<Failure, Unit>> adminCreateUser({
    required String email,
    required String name,
    required RoleEnum role,
    required List<String> groups,
  });
  Future<Either<Failure, List<UserInfo>>> listUsersInGroup({
    required String group,
  });
}
