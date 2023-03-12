class UserInfoModel {
  UserInfoModel({
    required this.id,
    required this.fullName,
    required this.gender,
    required this.phoneNumber,
    required this.refreshToken,
    required this.isActive,
    required this.accessToken,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String fullName;
  final String gender;
  final String phoneNumber;
  final String? refreshToken;
  final bool? isActive;
  final String? accessToken;
  final String createdAt;
  final String updatedAt;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      id: json["id"],
      fullName: json["full_name"],
      gender: json["gender"],
      phoneNumber: json["phone_number"],
      refreshToken: json["refresh_token"],
      isActive: json["is_active"],
      accessToken: json["access_token"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }
}
