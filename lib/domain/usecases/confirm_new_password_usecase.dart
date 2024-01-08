import 'package:dartz/dartz.dart';
import 'package:intelicity_auth_microapp_flutter/domain/errors/errors.dart';
import 'package:intelicity_auth_microapp_flutter/domain/repositories/auth_repository_interface.dart';

abstract class IConfirmNewPasswordUsecase {
  Future<Either<Failure, Unit>> call(String newPassword);
}

class ConfirmNewPasswordUsecaseImpl implements IConfirmNewPasswordUsecase {
  final IAuthRepository _repository;

  ConfirmNewPasswordUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, Unit>> call(String newPassword) async {
    return await _repository.confirmNewPassword(newPassword: newPassword);
  }
}
