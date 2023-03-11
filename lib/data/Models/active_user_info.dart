class ActiveUserInfo {
  ActiveUserInfo({
    required this.createdAt,
    required this.fullName,
    required this.gender,
    required this.id,
    required this.phoneNumber,
    required this.updatedAt,
  });

  final String id;
  final String fullName;
  final String gender;
  final String phoneNumber;
  final String createdAt;
  final String updatedAt;

  factory ActiveUserInfo.fromJson(Map<String, dynamic> json) {
    return ActiveUserInfo(
      id: json["id"],
      fullName: json["full_name"],
      gender: json["gender"],
      phoneNumber: json["phone_number"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }
}
