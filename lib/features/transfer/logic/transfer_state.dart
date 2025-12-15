import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';
part 'transfer_state.freezed.dart';

@freezed
class TransferState<T> with _$TransferState<T> {
  const factory TransferState.initial() = _Initial;
  const factory TransferState.loading() = _Loading;
  const factory TransferState.success(T data) = _Success<T>;
  const factory TransferState.error(ApiErrorModel apiErrorModel) = _Error;
}
