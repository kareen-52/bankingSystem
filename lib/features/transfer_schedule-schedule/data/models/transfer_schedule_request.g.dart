// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_schedule_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferScheduleRequest _$TransferScheduleRequestFromJson(
  Map<String, dynamic> json,
) => TransferScheduleRequest(
  amount: json['amount'] as String,
  date: json['date'] as String,
  accountNumberSender: json['account_number_sender'] as String,
  accountNumberReceiver: json['account_number_reciever'] as String,
);

Map<String, dynamic> _$TransferScheduleRequestToJson(
  TransferScheduleRequest instance,
) => <String, dynamic>{
  'account_number_sender': instance.accountNumberSender,
  'amount': instance.amount,
  'date': instance.date,
  'account_number_reciever': instance.accountNumberReceiver,
};
