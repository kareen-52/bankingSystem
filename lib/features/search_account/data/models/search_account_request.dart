
import 'package:json_annotation/json_annotation.dart';
part 'search_account_request.g.dart';

@JsonSerializable()
class SearchAccountRequest{
  @JsonKey(name: 'account_number')
  final String accountNumber;


  SearchAccountRequest({required this.accountNumber,});

  Map<String, dynamic> toJson() => _$SearchAccountRequestToJson(this);
}



