import 'package:json_annotation/json_annotation.dart';

part 'deposit_or_withdrawal_schedule_response.g.dart';
@JsonSerializable()
class DepositOrWithdrawalScheduleResponse {

  String message;
  final bool? success;

  DepositOrWithdrawalScheduleResponse({ required this.message, this.success });

  factory DepositOrWithdrawalScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$DepositOrWithdrawalScheduleResponseFromJson(json);

}
