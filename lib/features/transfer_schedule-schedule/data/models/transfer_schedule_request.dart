import 'package:json_annotation/json_annotation.dart';
part 'transfer_schedule_request.g.dart';

@JsonSerializable()
class TransferScheduleRequest {
  @JsonKey(name: 'account_number_sender')
  final String accountNumberSender;

  final String amount;
  final String date;

  @JsonKey(name: 'account_number_reciever')
  final String accountNumberReceiver;

  TransferScheduleRequest({
    required this.amount,
    required this.date,
    required this.accountNumberSender,
    required this.accountNumberReceiver,
  });

  Map<String, dynamic> toJson() => _$TransferScheduleRequestToJson(this);
}



