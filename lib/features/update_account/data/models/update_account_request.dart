import 'package:json_annotation/json_annotation.dart';
part 'update_account_request.g.dart';

@JsonSerializable()
class UpdateAccountRequest {

  @JsonKey(name: 'account_status')
  final String accountStatus;
  @JsonKey(name: 'parent_account_number', includeIfNull: false)
  final String? parentAccountNumber;

  UpdateAccountRequest({
    required this.accountStatus,
    this.parentAccountNumber,
  });

  Map<String, dynamic> toJson() => _$UpdateAccountRequestToJson(this);
}


