import 'package:json_annotation/json_annotation.dart';
part 'deposit_or_withdrawal_schedule_request.g.dart';

@JsonSerializable()
class DepositOrWithdrawalScheduleRequest {
  @JsonKey(name: 'transaction_type')
  final String transactionType;

  final String amount;
  final String date;

  @JsonKey(name: 'account_number')
  final String accountNumber;

  DepositOrWithdrawalScheduleRequest({
    required this.transactionType,
    required this.amount,
    required this.accountNumber,
    required this.date,
  });

  Map<String, dynamic> toJson() => _$DepositOrWithdrawalScheduleRequestToJson(this);
}



