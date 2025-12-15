
import 'package:json_annotation/json_annotation.dart';
part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest{
  @JsonKey(name: 'user_number')
  final String userNumber;
  final String password;

  LoginRequest({required this.userNumber, required this.password});

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
