import 'package:json_annotation/json_annotation.dart';
part 'account_details_model.g.dart';

@JsonSerializable()
class AccountDetailsModel {
  final int id;
  @JsonKey(name: 'account_number')
  final String accountNumber;
  final String balance;
  final String? type;
  final String? hierarchy;
  final String? status;

  AccountDetailsModel({
    required this.id,
    required this.accountNumber,
    required this.balance,
    this.type,
    this.hierarchy,
    this.status,
  });

  factory AccountDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AccountDetailsModelFromJson(json);
}