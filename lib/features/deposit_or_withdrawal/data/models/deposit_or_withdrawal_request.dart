import 'package:json_annotation/json_annotation.dart';
part 'deposit_or_withdrawal_request.g.dart';

@JsonSerializable()
class DepositOrWithdrawalRequest {
  @JsonKey(name: 'transaction_type')
  final String transactionType;

  final String amount;

  @JsonKey(name: 'account_number')
  final String accountNumber;

  DepositOrWithdrawalRequest({
    required this.transactionType,
    required this.amount,
    required this.accountNumber,
  });

  Map<String, dynamic> toJson() => _$DepositOrWithdrawalRequestToJson(this);
}
