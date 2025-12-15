import 'package:banking_system/features/search_account/data/models/account_details_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_account_response.g.dart';

@JsonSerializable()
class SearchAccountResponse {

@JsonKey(name: 'total_balance')
  final double? totalBalance;
  
  @JsonKey(name: 'account_numbers')
  final String? accountNumbers;
  
  @JsonKey(name: 'main_account')
  final AccountDetailsModel? mainAccount;
  
  final List<AccountDetailsModel>? children;
  
  final double? interest;
  
  @JsonKey(name: 'new_balance_after_interest')
  final double? newBalanceAfterInterest;

  SearchAccountResponse({
    this.totalBalance,
    this.accountNumbers,
    this.mainAccount,
    this.children,
    this.interest,
    this.newBalanceAfterInterest,
  });

  factory SearchAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchAccountResponseFromJson(json);
}


