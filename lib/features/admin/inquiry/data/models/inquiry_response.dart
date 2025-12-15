import 'package:json_annotation/json_annotation.dart';

part 'inquiry_response.g.dart';

@JsonSerializable(explicitToJson: true)
class InquiriesResponse {
  final String? message;
  final List<Inquiry> inquiries;

  InquiriesResponse({required this.inquiries,  this.message});

  factory InquiriesResponse.fromJson(Map<String, dynamic> json) =>
      _$InquiriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InquiriesResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Inquiry {
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  final String title;
  final String description;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  final AppUser user;

  Inquiry({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory Inquiry.fromJson(Map<String, dynamic> json) =>
      _$InquiryFromJson(json);

  Map<String, dynamic> toJson() => _$InquiryToJson(this);
}

@JsonSerializable()
class AppUser {
  final int id;
  @JsonKey(name: 'role_id')
  final int roleId;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'user_number')
  final String userNumber;
  @JsonKey(name: 'national_number')
  final String nationalNumber;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String location;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  AppUser({
    required this.id,
    required this.roleId,
    required this.phoneNumber,
    required this.userNumber,
    required this.nationalNumber,
    required this.firstName,
    required this.lastName,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}
