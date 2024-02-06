import 'package:dartz/dartz.dart';
import 'package:intelicity_auth_microapp_flutter/domain/entities/user_info.dart';
import 'package:intelicity_auth_microapp_flutter/domain/errors/errors.dart';
import 'package:intelicity_auth_microapp_flutter/domain/repositories/auth_repository_interface.dart';

abstract class IListUsersInGroupUsecase {
  Future<Either<Failure, List<UserInfo>>> call({required String group});
}

class ListUsersInGroupUsecaseImpl implements IListUsersInGroupUsecase {
  final IAuthRepository _repository;

  ListUsersInGroupUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, List<UserInfo>>> call({required String group}) async {
    return await _repository.listUsersInGroup(group: group);
  }
}
