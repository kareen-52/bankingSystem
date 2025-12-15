// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateAccountRequest _$UpdateAccountRequestFromJson(
  Map<String, dynamic> json,
) => UpdateAccountRequest(
  accountStatus: json['account_status'] as String,
  parentAccountNumber: json['parent_account_number'] as String?,
);

Map<String, dynamic> _$UpdateAccountRequestToJson(
  UpdateAccountRequest instance,
) => <String, dynamic>{
  'account_status': instance.accountStatus,
  'parent_account_number': ?instance.parentAccountNumber,
};
