import 'package:json_annotation/json_annotation.dart';

part 'transactions_response.g.dart';

@JsonSerializable(explicitToJson: true)
class TransactionsResponse {
  final Transactions transactions;

  TransactionsResponse({required this.transactions});

  factory TransactionsResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionsResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Transactions {
  final List<TransactionItem> sent;
  final List<TransactionItem> received;
  final List<TransactionItem> deposit;
  final List<TransactionItem> withdrawal;

  Transactions({
    required this.sent,
    required this.received,
    required this.deposit,
    required this.withdrawal,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) =>
      _$TransactionsFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionsToJson(this);
}

@JsonSerializable()
class TransactionItem {
  final int id;
  final String type;
  final String amount;
  final DateTime date;

  TransactionItem({
    required this.id,
    required this.type,
    required this.amount,
    required this.date,
  });

  factory TransactionItem.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionItemToJson(this);
}