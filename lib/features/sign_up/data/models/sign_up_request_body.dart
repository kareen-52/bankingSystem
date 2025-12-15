import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {

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
  final String balance;
  @JsonKey(name: 'account_hierarchy')
  final String accountHierarchy;
  @JsonKey(name: 'account_type')
  final String accountType;
  @JsonKey(name: 'parent_account_number', includeIfNull: false)
  final String? parentAccountNumber;

  SignupRequestBody({
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.location,
    required this.phoneNumber,
    required this.nationalNumber,
    required this.userNumber,
    required this.passwordConfirmation,
    required this.balance,
    required this.accountHierarchy,
    required this.accountType,
    this.parentAccountNumber,
  });

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}