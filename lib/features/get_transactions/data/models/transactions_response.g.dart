// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionsResponse _$TransactionsResponseFromJson(
  Map<String, dynamic> json,
) => TransactionsResponse(
  transactions: Transactions.fromJson(
    json['transactions'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$TransactionsResponseToJson(
  TransactionsResponse instance,
) => <String, dynamic>{'transactions': instance.transactions.toJson()};

Transactions _$TransactionsFromJson(Map<String, dynamic> json) => Transactions(
  sent: (json['sent'] as List<dynamic>)
      .map((e) => TransactionItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  received: (json['received'] as List<dynamic>)
      .map((e) => TransactionItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  deposit: (json['deposit'] as List<dynamic>)
      .map((e) => TransactionItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  withdrawal: (json['withdrawal'] as List<dynamic>)
      .map((e) => TransactionItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TransactionsToJson(Transactions instance) =>
    <String, dynamic>{
      'sent': instance.sent.map((e) => e.toJson()).toList(),
      'received': instance.received.map((e) => e.toJson()).toList(),
      'deposit': instance.deposit.map((e) => e.toJson()).toList(),
      'withdrawal': instance.withdrawal.map((e) => e.toJson()).toList(),
    };

TransactionItem _$TransactionItemFromJson(Map<String, dynamic> json) =>
    TransactionItem(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String,
      amount: json['amount'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$TransactionItemToJson(TransactionItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
    };
