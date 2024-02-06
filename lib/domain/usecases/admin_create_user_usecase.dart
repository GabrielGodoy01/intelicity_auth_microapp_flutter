import 'package:dartz/dartz.dart';
import 'package:intelicity_auth_microapp_flutter/domain/enum/role_enum.dart';
import 'package:intelicity_auth_microapp_flutter/domain/errors/errors.dart';
import 'package:intelicity_auth_microapp_flutter/domain/repositories/auth_repository_interface.dart';

abstract class IAdminCreateUserUsecase {
  Future<Either<Failure, Unit>> call(
      {required String email,
      required String name,
      required RoleEnum role,
      required List<String> groups});
}

class AdminCreateUserUsecaseImpl implements IAdminCreateUserUsecase {
  final IAuthRepository _repository;

  AdminCreateUserUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, Unit>> call(
      {required String email,
      required String name,
      required RoleEnum role,
      required List<String> groups}) async {
    return await _repository.adminCreateUser(
        email: email, name: name, role: role, groups: groups);
  }
}
