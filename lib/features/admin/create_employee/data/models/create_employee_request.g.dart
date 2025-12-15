// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_employee_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateEmployeeRequest _$CreateEmployeeRequestFromJson(
  Map<String, dynamic> json,
) => CreateEmployeeRequest(
  password: json['password'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  location: json['location'] as String,
  phoneNumber: json['phone_number'] as String,
  nationalNumber: json['national_number'] as String,
  userNumber: json['user_number'] as String,
  passwordConfirmation: json['password_confirmation'] as String,
);

Map<String, dynamic> _$CreateEmployeeRequestToJson(
  CreateEmployeeRequest instance,
) => <String, dynamic>{
  'national_number': instance.nationalNumber,
  'user_number': instance.userNumber,
  'password': instance.password,
  'password_confirmation': instance.passwordConfirmation,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'location': instance.location,
  'phone_number': instance.phoneNumber,
};
