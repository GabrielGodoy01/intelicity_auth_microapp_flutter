import 'package:dartz/dartz.dart';
import 'package:intelicity_auth_microapp_flutter/domain/entities/logged_user_info.dart';
import 'package:intelicity_auth_microapp_flutter/domain/errors/errors.dart';

abstract class IAuthRepository {
  Future<Either<Failure, LoggedUserInfo>> loginEmail(
      {required String email, required String password});
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, LoggedUserInfo>> getLoggedUser();
}
