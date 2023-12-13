abstract class Failure implements Exception {
  String get message;
}

class ErrorLoginEmail extends Failure {
  ErrorLoginEmail(this.message);

  @override
  final String message;
}

class ErrorLogout extends Failure {
  ErrorLogout(this.message);

  @override
  final String message;
}

class ErrorGetLoggedUser extends Failure {
  ErrorGetLoggedUser(this.message);

  @override
  final String message;
}

class ErrorResetPassword extends Failure {
  ErrorResetPassword(this.message);

  @override
  final String message;
}

class ErrorConfirmResetPassword extends Failure {
  ErrorConfirmResetPassword(this.message);

  @override
  final String message;
}

class ErrorEmailInvalid extends Failure {
  ErrorEmailInvalid(this.message);

  @override
  final String message;
}
