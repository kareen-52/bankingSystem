import 'package:json_annotation/json_annotation.dart';

part 'transfer_schedule_response.g.dart';
@JsonSerializable()
class TransferScheduleResponse {

  String message;
  final bool? success;

  TransferScheduleResponse({ required this.message, this.success });

  factory TransferScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$TransferScheduleResponseFromJson(json);

}
