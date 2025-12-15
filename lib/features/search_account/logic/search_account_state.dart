import 'package:banking_system/features/search_account/data/models/search_account_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';

part 'search_account_state.freezed.dart';

@freezed
class SearchAccountState with _$SearchAccountState {
  const factory SearchAccountState.initial() = _Initial;
  const factory SearchAccountState.loading() = Loading;
  const factory SearchAccountState.success(SearchAccountResponse data) = Success;
  const factory SearchAccountState.error(ApiErrorModel error) = Error;
}