import 'package:dartz/dartz.dart';
import 'package:intelicity_auth_microapp_flutter/domain/entities/logged_user_info.dart';
import 'package:intelicity_auth_microapp_flutter/domain/errors/errors.dart';
import 'package:intelicity_auth_microapp_flutter/domain/repositories/auth_repository_interface.dart';

abstract class IGetLoggedUserUsecase {
  Future<Either<Failure, LoggedUserInfo>> call();
}

class GetLoggedUserImpl implements IGetLoggedUserUsecase {
  final IAuthRepository authRepository;

  GetLoggedUserImpl(this.authRepository);

  @override
  Future<Either<Failure, LoggedUserInfo>> call() async {
    return await authRepository.getLoggedUser();
  }
}
