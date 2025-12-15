
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';
part 'deposit_or_withdrawal_schedule_state.freezed.dart';

@freezed
class DepositOrWithdrawalScheduleState<T> with _$DepositOrWithdrawalScheduleState<T> {
  const factory DepositOrWithdrawalScheduleState.initial() = _Initial;
  const factory DepositOrWithdrawalScheduleState.loading() = Loading;
  const factory DepositOrWithdrawalScheduleState.success(T data) = Success<T>;
  const factory DepositOrWithdrawalScheduleState.error(ApiErrorModel apiErrorModel) = Error;
}
