import 'package:json_annotation/json_annotation.dart';
part 'close_account_respone.g.dart';

@JsonSerializable()
class CloseAccountResponse {
  String? message;

  CloseAccountResponse({ this.message, });

  factory CloseAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$CloseAccountResponseFromJson(json);
}