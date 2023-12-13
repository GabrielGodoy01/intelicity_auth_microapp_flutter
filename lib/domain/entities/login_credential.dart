class LoginCredential {
  final String email;
  final String password;

  LoginCredential._({required this.email, required this.password});

  factory LoginCredential.withEmailAndPassword(
      {required String email, required String password}) {
    return LoginCredential._(email: email, password: password);
  }
}
