import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intelicity_auth_microapp_flutter/domain/enum/role_enum.dart';
import 'package:intelicity_auth_microapp_flutter/domain/errors/auth_errors.dart';
import 'package:intelicity_auth_microapp_flutter/infra/datasource/auth_datasource_interface.dart';
import 'package:intelicity_auth_microapp_flutter/infra/dtos/logged_user_dto.dart';
import 'package:intelicity_auth_microapp_flutter/infra/dtos/user_dto.dart';
import 'package:intelicity_auth_microapp_flutter/shared/helpers/services/http/http_request_interface.dart';
import 'package:logger/logger.dart';

class CognitoDatasource implements IAuthDatasource {
  // final Logger logger = Modular.get<Logger>();
  // final IHttpRequest _httpService;

  // CognitoDatasource(this._httpService);
  @override
  Future<LoggedUserDto> loginEmail(
      {required String email, required String password}) async {
    await Amplify.Auth.signOut();
    final result = await Amplify.Auth.signIn(
      username: email,
      password: password,
    );
    // logger.d('[CognitoDatasource] loginEmail: ${result.toJson()}}');
    final cognitoPlugin = Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
    final session = await cognitoPlugin.fetchAuthSession();
    if (result.nextStep.signInStep ==
        AuthSignInStep.confirmSignInWithNewPassword) {
      throw NewPasswordNecessaryError();
    }
    final atribbutes = await Amplify.Auth.fetchUserAttributes();

    return LoggedUserDto(
      email: email,
      sub: session.userSubResult.value,
      role: RoleEnum.stringToEnum(atribbutes
          .firstWhere((element) =>
              element.userAttributeKey.toString() == 'custom:general_role')
          .value),
      accessToken: session.userPoolTokensResult.value.accessToken.raw,
      name: session.userPoolTokensResult.value.idToken.name!,
      idToken: session.userPoolTokensResult.value.idToken.raw,
      refreshToken: session.userPoolTokensResult.value.refreshToken,
      groups: session.userPoolTokensResult.value.idToken.groups,
    );
  }

  @override
  Future<void> logout() async {
    final result = await Amplify.Auth.signOut();
    if (result is CognitoCompleteSignOut) {
      // logger.d('Sign out completed successfully');
    } else if (result is CognitoFailedSignOut) {
      // logger.d('Error signing user out: ${result.exception.message}');
      throw Exception();
    }
  }

  @override
  Future<LoggedUserDto?> getLoggedUser() async {
    try {
      final cognitoPlugin =
          Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
      final session = await cognitoPlugin.fetchAuthSession();
      // logger.d('User is signed in: ${session.isSignedIn}');
      if (!session.isSignedIn) {
        return null;
      }
      final atribbutes = await Amplify.Auth.fetchUserAttributes();
      return LoggedUserDto(
        email: session.userPoolTokensResult.value.idToken.email!,
        sub: session.userSubResult.value,
        role: RoleEnum.stringToEnum(atribbutes
            .firstWhere((element) =>
                element.userAttributeKey.toString() == 'custom:general_role')
            .value),
        accessToken: session.userPoolTokensResult.value.accessToken.raw,
        name: session.userPoolTokensResult.value.idToken.name!,
        idToken: session.userPoolTokensResult.value.idToken.raw,
        refreshToken: session.userPoolTokensResult.value.refreshToken,
        groups: session.userPoolTokensResult.value.idToken.groups,
      );
    } on AuthException catch (e) {
      // logger.d('Error retrieving auth session: ${e.message}');
      throw Exception();
    }
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await Amplify.Auth.resetPassword(username: email);
  }

  @override
  Future<void> confirmResetPassword(
      {required String email,
      required String code,
      required String newPassword}) async {
    await Amplify.Auth.confirmResetPassword(
        username: email, newPassword: newPassword, confirmationCode: code);
  }

  @override
  Future<void> confirmNewPassword({required String newPassword}) async {
    await Amplify.Auth.confirmSignIn(
      confirmationValue: newPassword,
    );
  }

  // @override
  // Future<void> adminCreateUser(
  //     {required String email,
  //     required String name,
  //     required RoleEnum role,
  //     required List<String> groups}) async {
  //   var data = {
  //     "email": email,
  //     "name": name,
  //     "role": role.name,
  //     "groups": groups
  //   };
  //   var response = await _httpService.post('/admin-create-user', data: data);
  //   if (response.statusCode == 200) {
  //     return;
  //   }
  //   throw Exception();
  // }

  // @override
  // Future<List<UserDto>> getListUsersInGroup({required String group}) async {
  //   var response = await _httpService.get('/get-users-in-group?group=$group');
  //   if (response.statusCode == 200) {
  //     return UserDto.fromMaps(response.data["users"]);
  //   }
  //   throw Exception();
  // }
}
