// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDetailsModel _$AccountDetailsModelFromJson(Map<String, dynamic> json) =>
    AccountDetailsModel(
      id: (json['id'] as num).toInt(),
      accountNumber: json['account_number'] as String,
      balance: json['balance'] as String,
      type: json['type'] as String?,
      hierarchy: json['hierarchy'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$AccountDetailsModelToJson(
  AccountDetailsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'account_number': instance.accountNumber,
  'balance': instance.balance,
  'type': instance.type,
  'hierarchy': instance.hierarchy,
  'status': instance.status,
};
