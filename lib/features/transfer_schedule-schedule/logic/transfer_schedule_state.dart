
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';
part 'transfer_schedule_state.freezed.dart';

@freezed
class TransferScheduleScheduleState<T> with _$TransferScheduleScheduleState<T> {
  const factory TransferScheduleScheduleState.initial() = _Initial;
  const factory TransferScheduleScheduleState.loading() = Loading;
  const factory TransferScheduleScheduleState.success(T data) = Success<T>;
  const factory TransferScheduleScheduleState.error(ApiErrorModel apiErrorModel) = Error;
}
