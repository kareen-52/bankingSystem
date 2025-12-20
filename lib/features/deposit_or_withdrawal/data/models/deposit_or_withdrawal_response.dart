import 'package:json_annotation/json_annotation.dart';

part 'deposit_or_withdrawal_response.g.dart';

@JsonSerializable()
class DepositOrWithdrawalResponse {
  String message;
  final bool? success;

  DepositOrWithdrawalResponse({required this.message, this.success});

  factory DepositOrWithdrawalResponse.fromJson(Map<String, dynamic> json) =>
      _$DepositOrWithdrawalResponseFromJson(json);
}
