import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/networking/api_error_model.dart';

part 'update_account.freezed.dart';

@freezed
class UpdateAccountState<T> with _$UpdateAccountState<T> {
  const factory UpdateAccountState.initial() = _Initial;

  const factory UpdateAccountState.updateAccountLoading() = UpdateAccountLoading;
  const factory UpdateAccountState.updateAccountSuccess(T data) = UpdateAccountSuccess<T>;
  const factory UpdateAccountState.updateAccountError(ApiErrorModel apiErrorModel) = UpdateAccountError;
}