import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_error_model.dart';

part 'create_employee_state.freezed.dart';

// Defines the various states for creating an employee
@freezed
class CreateEmployeeState<T> with _$CreateEmployeeState<T> {
  const factory CreateEmployeeState.initial() = _Initial;

  const factory CreateEmployeeState.createEmployeeLoading() = CreateEmployeeLoading;
  const factory CreateEmployeeState.createEmployeeSuccess(T data) = CreateEmployeeSuccess<T>;
  const factory CreateEmployeeState.createEmployeeError(ApiErrorModel apiErrorModel) = CreateEmployeeError;
}