import 'package:dartz/dartz.dart';
import 'package:intelicity_auth_microapp_flutter/domain/errors/errors.dart';
import 'package:intelicity_auth_microapp_flutter/domain/repositories/auth_repository_interface.dart';

abstract class IConfirmResetPasswordUsecase {
  Future<Either<Failure, Unit>> call(
      String email, String code, String newPassword);
}

class ConfirmResetPasswordUsecaseImpl implements IConfirmResetPasswordUsecase {
  final IAuthRepository _repository;

  ConfirmResetPasswordUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, Unit>> call(
      String email, String code, String newPassword) async {
    return await _repository.confirmResetPassword(
        email: email, code: code, newPassword: newPassword);
  }
}
