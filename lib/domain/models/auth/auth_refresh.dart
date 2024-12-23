class AuthRefresh {
  final String refreshToken;

  AuthRefresh(this.refreshToken);

  Map<String, dynamic> toMap() {
    return {
      'refreshToken': refreshToken,
    };
  }
}