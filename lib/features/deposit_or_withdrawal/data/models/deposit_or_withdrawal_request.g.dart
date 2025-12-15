// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_or_withdrawal_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositOrWithdrawalRequest _$DepositOrWithdrawalRequestFromJson(
  Map<String, dynamic> json,
) => DepositOrWithdrawalRequest(
  transactionType: json['transaction_type'] as String,
  amount: json['amount'] as String,
  accountNumber: json['account_number'] as String,
);

Map<String, dynamic> _$DepositOrWithdrawalRequestToJson(
  DepositOrWithdrawalRequest instance,
) => <String, dynamic>{
  'transaction_type': instance.transactionType,
  'amount': instance.amount,
  'account_number': instance.accountNumber,
};
