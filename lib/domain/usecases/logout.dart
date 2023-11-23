import 'package:dartz/dartz.dart';
import 'package:intelicity_auth_microapp_flutter/domain/errors/errors.dart';
import 'package:intelicity_auth_microapp_flutter/domain/repositories/auth_repository_interface.dart';

abstract class Logout {
  Future<Either<Failure, Unit>> call();
}

class LogoutImpl implements Logout {
  final IAuthRepository authRepository;

  LogoutImpl(this.authRepository);

  @override
  Future<Either<Failure, Unit>> call() async {
    return await authRepository.logout();
  }
}
