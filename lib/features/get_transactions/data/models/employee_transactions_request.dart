import 'package:json_annotation/json_annotation.dart';

part 'employee_transactions_request.g.dart';

@JsonSerializable()
class EmployeeTransactionsRequest {
  @JsonKey(name: 'account_number')
  final String accountNumber;

  EmployeeTransactionsRequest({required this.accountNumber});

  Map<String, dynamic> toJson() => _$EmployeeTransactionsRequestToJson(this);
}