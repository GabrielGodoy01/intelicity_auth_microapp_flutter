import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/domain/entities/logged_user_info.dart';
import 'package:intelicity_auth_microapp_flutter/domain/errors/errors.dart';
import 'package:intelicity_auth_microapp_flutter/domain/repositories/auth_repository_interface.dart';
import 'package:intelicity_auth_microapp_flutter/infra/datasource/auth_datasource_interface.dart';
import 'package:logger/logger.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthDatasource datasource;
  final Logger logger = Modular.get();

  AuthRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, LoggedUserInfo>> loginEmail(
      {required String email, required String password}) async {
    try {
      logger.i('LoginRepositoryImpl.loginEmail');
      final user =
          await datasource.loginEmail(email: email, password: password);
      return Right(user);
    } catch (e) {
      logger.e(e);
      return Left(ErrorLoginEmail('Error login with email'));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await datasource.logout();
      return const Right(unit);
    } catch (e) {
      return Left(ErrorLogout('Error logout'));
    }
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> getLoggedUser() async {
    try {
      final user = await datasource.getLoggedUser();
      if (user != null) {
        return Right(user);
      }
      return Left(ErrorGetLoggedUser('Error get logged user'));
    } catch (e) {
      return Left(ErrorGetLoggedUser('Error get logged user'));
    }
  }
}
