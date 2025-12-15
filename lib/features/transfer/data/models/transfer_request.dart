
import 'package:json_annotation/json_annotation.dart';
part 'transfer_request.g.dart';

@JsonSerializable()
class TransferRequest{
  @JsonKey(name: 'account_number_reciever')
  final String accountNumberReceiver;
  final String amount;
  @JsonKey(name: 'account_number_sender')
  final String accountNumberSender;

  TransferRequest({required this.accountNumberReceiver, required this.amount, required this.accountNumberSender,});

  Map<String, dynamic> toJson() => _$TransferRequestToJson(this);
}



