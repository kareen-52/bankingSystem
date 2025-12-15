import 'package:json_annotation/json_annotation.dart';
part 'create_employee_request.g.dart';

@JsonSerializable()
class CreateEmployeeRequest {

  @JsonKey(name: 'national_number')
  final String nationalNumber;
  @JsonKey(name: 'user_number')
  final String userNumber;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String location;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;



  CreateEmployeeRequest({
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.location,
    required this.phoneNumber,
    required this.nationalNumber,
    required this.userNumber,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => _$CreateEmployeeRequestToJson(this);
}