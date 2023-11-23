import 'package:string_validator/string_validator.dart' as validator;

class LoginCredential {
  final String email;
  final String password;

  LoginCredential._({required this.email, required this.password});
  bool get isValidEmail => validator.isEmail(email);
  bool get isValidPassword => password.isNotEmpty && password.length > 7;
  factory LoginCredential.withEmailAndPassword(
      {required String email, required String password}) {
    return LoginCredential._(email: email, password: password);
  }
}
