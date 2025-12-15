import 'package:json_annotation/json_annotation.dart';

part 'transfer_response.g.dart';
@JsonSerializable()
class TransferResponse {

  String message;
  // String success;
  final bool? success;

  TransferResponse({ required this.message, this.success });



  factory TransferResponse.fromJson(Map<String, dynamic> json) =>
      _$TransferResponseFromJson(json);

}
