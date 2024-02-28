import 'package:dartz/dartz.dart';
import 'package:intelicity_auth_microapp_flutter/domain/errors/errors.dart';
import 'package:intelicity_auth_microapp_flutter/domain/repositories/auth_repository_interface.dart';

abstract class IResendConfirmationCodeUsecase {
  Future<Either<Failure, Unit>> call(String email);
}

class ResendConfirmationCodeUsecaseImpl
    implements IResendConfirmationCodeUsecase {
  final IAuthRepository authRepository;

  ResendConfirmationCodeUsecaseImpl(this.authRepository);
  @override
  Future<Either<Failure, Unit>> call(String email) async {
    return await authRepository.resendConfirmationCode(email: email);
  }
}
