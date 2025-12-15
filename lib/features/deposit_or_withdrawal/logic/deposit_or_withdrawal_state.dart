
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';
part 'deposit_or_withdrawal_state.freezed.dart';

@freezed
class DepositOrWithdrawalState<T> with _$DepositOrWithdrawalState<T> {
  const factory DepositOrWithdrawalState.initial() = _Initial;
  const factory DepositOrWithdrawalState.loading() = Loading;
  const factory DepositOrWithdrawalState.success(T data) = Success<T>;
  const factory DepositOrWithdrawalState.error(ApiErrorModel apiErrorModel) = Error;
}
