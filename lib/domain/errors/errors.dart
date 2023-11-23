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
