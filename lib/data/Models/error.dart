class UserAuthError {
  UserAuthError({
    required this.code,
    required this.message,
    required this.error,
  });

  final String code;
  final String message;
  final String error;

  factory UserAuthError.fromJson(Map<String, dynamic> json) {
    return UserAuthError(
      code: json["code"],
      message: json["full_name"],
      error: json["error"],
    );
  }
}
