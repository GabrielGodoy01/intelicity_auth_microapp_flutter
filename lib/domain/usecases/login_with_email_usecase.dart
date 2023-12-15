import 'package:dartz/dartz.dart';
import 'package:intelicity_auth_microapp_flutter/domain/entities/logged_user_info.dart';
import 'package:intelicity_auth_microapp_flutter/domain/errors/errors.dart';
import 'package:intelicity_auth_microapp_flutter/domain/repositories/auth_repository_interface.dart';

abstract class ILoginWithEmailUsecase {
  Future<Either<Failure, LoggedUserInfo>> call(String email, String password);
}

class LoginWithEmailImpl implements ILoginWithEmailUsecase {
  final IAuthRepository authRepository;

  LoginWithEmailImpl(this.authRepository);
  @override
  Future<Either<Failure, LoggedUserInfo>> call(
      String email, String password) async {
    return await authRepository.loginEmail(
      email: email,
      password: password,
    );
  }
}
