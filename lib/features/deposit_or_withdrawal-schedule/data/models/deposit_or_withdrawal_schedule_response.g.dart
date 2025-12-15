// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_or_withdrawal_schedule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositOrWithdrawalScheduleResponse
_$DepositOrWithdrawalScheduleResponseFromJson(Map<String, dynamic> json) =>
    DepositOrWithdrawalScheduleResponse(
      message: json['message'] as String,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$DepositOrWithdrawalScheduleResponseToJson(
  DepositOrWithdrawalScheduleResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'success': instance.success,
};
