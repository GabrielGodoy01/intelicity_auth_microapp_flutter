import 'package:dartz/dartz.dart';
import 'package:intelicity_auth_microapp_flutter/domain/entities/user_info.dart';
import 'package:intelicity_auth_microapp_flutter/domain/enum/role_enum.dart';
import 'package:intelicity_auth_microapp_flutter/domain/errors/errors.dart';
import 'package:intelicity_auth_microapp_flutter/domain/repositories/auth_repository_interface.dart';

abstract class IUpdateUserUsecase {
  Future<Either<Failure, UserInfo>> call({
    required String email,
    required String name,
    required RoleEnum role,
    required List<String> groups,
  });
}

class UpdateUserUsecaseImpl implements IUpdateUserUsecase {
  final IAuthRepository _repository;

  UpdateUserUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, UserInfo>> call({
    required String email,
    required String name,
    required RoleEnum role,
    required List<String> groups,
  }) async {
    return await _repository.adminUpdateUser(
      email: email,
      name: name,
      role: role,
      groups: groups,
    );
  }
}
