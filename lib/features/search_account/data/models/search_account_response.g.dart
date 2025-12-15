// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchAccountResponse _$SearchAccountResponseFromJson(
  Map<String, dynamic> json,
) => SearchAccountResponse(
  totalBalance: (json['total_balance'] as num?)?.toDouble(),
  accountNumbers: json['account_numbers'] as String?,
  mainAccount: json['main_account'] == null
      ? null
      : AccountDetailsModel.fromJson(
          json['main_account'] as Map<String, dynamic>,
        ),
  children: (json['children'] as List<dynamic>?)
      ?.map((e) => AccountDetailsModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  interest: (json['interest'] as num?)?.toDouble(),
  newBalanceAfterInterest: (json['new_balance_after_interest'] as num?)
      ?.toDouble(),
);

Map<String, dynamic> _$SearchAccountResponseToJson(
  SearchAccountResponse instance,
) => <String, dynamic>{
  'total_balance': instance.totalBalance,
  'account_numbers': instance.accountNumbers,
  'main_account': instance.mainAccount,
  'children': instance.children,
  'interest': instance.interest,
  'new_balance_after_interest': instance.newBalanceAfterInterest,
};
