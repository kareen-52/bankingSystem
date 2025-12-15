// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inquiry_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InquiriesResponse _$InquiriesResponseFromJson(Map<String, dynamic> json) =>
    InquiriesResponse(
      inquiries: (json['inquiries'] as List<dynamic>)
          .map((e) => Inquiry.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$InquiriesResponseToJson(InquiriesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'inquiries': instance.inquiries.map((e) => e.toJson()).toList(),
    };

Inquiry _$InquiryFromJson(Map<String, dynamic> json) => Inquiry(
  id: (json['id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  user: AppUser.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$InquiryToJson(Inquiry instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'title': instance.title,
  'description': instance.description,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'user': instance.user.toJson(),
};

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
  id: (json['id'] as num).toInt(),
  roleId: (json['role_id'] as num).toInt(),
  phoneNumber: json['phone_number'] as String,
  userNumber: json['user_number'] as String,
  nationalNumber: json['national_number'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  location: json['location'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
  'id': instance.id,
  'role_id': instance.roleId,
  'phone_number': instance.phoneNumber,
  'user_number': instance.userNumber,
  'national_number': instance.nationalNumber,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'location': instance.location,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
