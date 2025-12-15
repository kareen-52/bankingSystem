// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_or_withdrawal_schedule_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositOrWithdrawalScheduleRequest _$DepositOrWithdrawalScheduleRequestFromJson(
  Map<String, dynamic> json,
) => DepositOrWithdrawalScheduleRequest(
  transactionType: json['transaction_type'] as String,
  amount: json['amount'] as String,
  accountNumber: json['account_number'] as String,
  date: json['date'] as String,
);

Map<String, dynamic> _$DepositOrWithdrawalScheduleRequestToJson(
  DepositOrWithdrawalScheduleRequest instance,
) => <String, dynamic>{
  'transaction_type': instance.transactionType,
  'amount': instance.amount,
  'date': instance.date,
  'account_number': instance.accountNumber,
};
