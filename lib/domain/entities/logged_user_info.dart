class LoggedUserInfo {
  final String email;
  final String name;
  final String sub;
  final String accessToken;
  final String refreshToken;
  final String idToken;
  LoggedUserInfo({
    required this.email,
    required this.name,
    required this.sub,
    required this.accessToken,
    required this.refreshToken,
    required this.idToken,
  });
}
