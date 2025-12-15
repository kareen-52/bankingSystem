// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferRequest _$TransferRequestFromJson(Map<String, dynamic> json) =>
    TransferRequest(
      accountNumberReceiver: json['account_number_reciever'] as String,
      amount: json['amount'] as String,
      accountNumberSender: json['account_number_sender'] as String,
    );

Map<String, dynamic> _$TransferRequestToJson(TransferRequest instance) =>
    <String, dynamic>{
      'account_number_reciever': instance.accountNumberReceiver,
      'amount': instance.amount,
      'account_number_sender': instance.accountNumberSender,
    };
