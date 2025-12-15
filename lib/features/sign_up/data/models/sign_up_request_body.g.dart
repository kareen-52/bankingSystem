// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestBody _$SignupRequestBodyFromJson(Map<String, dynamic> json) =>
    SignupRequestBody(
      password: json['password'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      location: json['location'] as String,
      phoneNumber: json['phone_number'] as String,
      nationalNumber: json['national_number'] as String,
      userNumber: json['user_number'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
      balance: json['balance'] as String,
      accountHierarchy: json['account_hierarchy'] as String,
      accountType: json['account_type'] as String,
      parentAccountNumber: json['parent_account_number'] as String?,
    );

Map<String, dynamic> _$SignupRequestBodyToJson(SignupRequestBody instance) =>
    <String, dynamic>{
      'national_number': instance.nationalNumber,
      'user_number': instance.userNumber,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'location': instance.location,
      'phone_number': instance.phoneNumber,
      'balance': instance.balance,
      'account_hierarchy': instance.accountHierarchy,
      'account_type': instance.accountType,
      'parent_account_number': ?instance.parentAccountNumber,
    };
