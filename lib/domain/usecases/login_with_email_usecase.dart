import 'package:dartz/dartz.dart';
import 'package:intelicity_auth_microapp_flutter/domain/entities/logged_user_info.dart';
import 'package:intelicity_auth_microapp_flutter/domain/entities/login_credential.dart';
import 'package:intelicity_auth_microapp_flutter/domain/errors/errors.dart';
import 'package:intelicity_auth_microapp_flutter/domain/repositories/auth_repository_interface.dart';

abstract class ILoginWithEmailUsecase {
  Future<Either<Failure, LoggedUserInfo>> call(LoginCredential credential);
}

class LoginWithEmailImpl implements ILoginWithEmailUsecase {
  final IAuthRepository authRepository;

  LoginWithEmailImpl(this.authRepository);
  @override
  Future<Either<Failure, LoggedUserInfo>> call(
      LoginCredential credential) async {
    if (!credential.isValidEmail) {
      return Left(ErrorLoginEmail('Invalid email'));
    } else if (!credential.isValidPassword) {
      return Left(ErrorLoginEmail('Invalid password'));
    }

    return await authRepository.loginEmail(
      email: credential.email,
      password: credential.password,
    );
  }
}
