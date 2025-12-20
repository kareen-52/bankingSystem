import 'package:json_annotation/json_annotation.dart';
part 'create_employee_response.g.dart';

@JsonSerializable()
class CreateEmployeeResponse {
  String? message;
  CreateEmployeeResponse({ this.message});

  factory CreateEmployeeResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateEmployeeResponseFromJson(json);
}