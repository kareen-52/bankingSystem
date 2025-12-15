import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';
@JsonSerializable()
class LoginResponse {

  String message;
  String token;
  int role;
  LoginResponse({ required this.message, required this.token ,required this.role});



  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

}
