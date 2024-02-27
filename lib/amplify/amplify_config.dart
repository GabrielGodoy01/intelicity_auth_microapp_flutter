import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:logger/logger.dart';

Future<void> configureAmplify(String amplifyconfig) async {
  try {
    if (!Amplify.isConfigured) {
      await Amplify.addPlugin(AmplifyAuthCognito());
      await Amplify.configure(amplifyconfig);
    }
  } on Exception catch (e) {
    Logger().e('Could not configure Amplify: $e');
  }
}