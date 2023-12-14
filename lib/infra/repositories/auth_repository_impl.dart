import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/domain/entities/logged_user_info.dart';
import 'package:intelicity_auth_microapp_flutter/domain/errors/errors.dart';
import 'package:intelicity_auth_microapp_flutter/domain/repositories/auth_repository_interface.dart';
import 'package:intelicity_auth_microapp_flutter/generated/l10n.dart';
import 'package:intelicity_auth_microapp_flutter/infra/datasource/auth_datasource_interface.dart';
import 'package:logger/logger.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthDatasource datasource;
  final Logger logger = Modular.get();

  AuthRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, LoggedUserInfo>> loginEmail(
      {required String email, required String password}) async {
    try {
      logger.i('AuthRepositoryImpl.loginEmail');
      final user =
          await datasource.loginEmail(email: email, password: password);
      return Right(user);
    } catch (e) {
      return left(_handleError(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await datasource.logout();
      return const Right(unit);
    } catch (e) {
      return Left(ErrorLogout('Error logout'));
    }
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> getLoggedUser() async {
    try {
      final user = await datasource.getLoggedUser();
      if (user != null) {
        return Right(user);
      }
      return Left(AuthError(
        message: S.current.authErrorsSchema('other'),
      ));
    } catch (e) {
      return left(_handleError(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPassword({required String email}) async {
    try {
      await datasource.resetPassword(email: email);
      return const Right(unit);
    } catch (e) {
      return left(_handleError(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> confirmResetPassword(
      {required String email,
      required String code,
      required String newPassword}) async {
    try {
      await datasource.confirmResetPassword(
          email: email, code: code, newPassword: newPassword);
      return const Right(unit);
    } catch (e) {
      return left(_handleError(e));
    }
  }

  AuthError _handleError(e) {
    logger.e(e);
    if (e is InvalidParameterException) {
      return AuthError(message: S.current.authErrorsSchema('invalidParameter'));
    } else if (e is LimitExceededException) {
      return AuthError(message: S.current.authErrorsSchema('limitExceeded'));
    } else if (e is TooManyFailedAttemptsException) {
      return AuthError(
          message: S.current.authErrorsSchema('tooManyFailedAttempts'));
    } else if (e is UserNotFoundException) {
      return AuthError(message: S.current.authErrorsSchema('userNotFound'));
    } else if (e is InternalErrorException) {
      return AuthError(message: S.current.authErrorsSchema('internalError'));
    } else if (e is CodeMismatchException) {
      return AuthError(message: S.current.authErrorsSchema('codeMismatch'));
    } else if (e is SignedOutException) {
      return AuthError(message: S.current.authErrorsSchema('signedOut'));
    } else if (e is NotAuthorizedServiceException) {
      return AuthError(message: S.current.authErrorsSchema('notAuthorized'));
    } else if (e is UserNotConfirmedException) {
      return AuthError(message: S.current.authErrorsSchema('userNotConfirmed'));
    } else if (e is UsernameExistsException) {
      return AuthError(message: S.current.authErrorsSchema('usernameExists'));
    } else if (e is InvalidParameterException) {
      return AuthError(message: S.current.authErrorsSchema('invalidParameter'));
    } else if (e is CodeMismatchException) {
      return AuthError(message: S.current.authErrorsSchema('codeMismatch'));
    } else if (e is CodeDeliveryFailureException) {
      return AuthError(
          message: S.current.authErrorsSchema('codeDeliveryFailure'));
    } else if (e is InvalidStateException) {
      return AuthError(
          message: S.current.authErrorsSchema('invalidStateException'));
    }
    return AuthError(
      message: S.current.authErrorsSchema('other'),
    );
  }
}
