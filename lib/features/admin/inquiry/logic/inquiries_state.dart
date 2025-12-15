import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_error_model.dart';

part 'inquiries_state.freezed.dart';

@freezed
class InquiriesState<T> with _$InquiriesState<T> {
  const factory InquiriesState.initial() = _Initial;

  const factory InquiriesState.inquiriesLoading() = InquiriesLoading;
  const factory InquiriesState.inquiriesSuccess(T data) = InquiriesSuccess<T>;
  const factory InquiriesState.inquiriesError(ApiErrorModel apiErrorModel) = InquiriesError;
}