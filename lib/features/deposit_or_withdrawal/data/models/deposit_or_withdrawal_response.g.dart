// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_or_withdrawal_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositOrWithdrawalResponse _$DepositOrWithdrawalResponseFromJson(
  Map<String, dynamic> json,
) => DepositOrWithdrawalResponse(
  message: json['message'] as String,
  success: json['success'] as bool?,
);

Map<String, dynamic> _$DepositOrWithdrawalResponseToJson(
  DepositOrWithdrawalResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'success': instance.success,
};
