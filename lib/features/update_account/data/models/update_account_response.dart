import 'package:json_annotation/json_annotation.dart';
part 'update_account_response.g.dart';

@JsonSerializable()
class UpdateAccountResponse {
  String? message;

  UpdateAccountResponse({ this.message, });

  factory UpdateAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAccountResponseFromJson(json);
}