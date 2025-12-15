import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/networking/api_error_model.dart';

part 'close_account_state.freezed.dart';

@freezed
class CloseAccountState<T> with _$CloseAccountState<T> {
  const factory CloseAccountState.initial() = _Initial;

  const factory CloseAccountState.closeAccountLoading() = CloseAccountLoading;
  const factory CloseAccountState.closeAccountSuccess(T data) = CloseAccountSuccess<T>;
  const factory CloseAccountState.closeAccountError(ApiErrorModel apiErrorModel) = CloseAccountError;
}