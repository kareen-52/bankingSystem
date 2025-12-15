import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';
import '../models/create_employee_request.dart';
import '../models/create_employee_response.dart';

class CreateEmployeeRepo {
  final ApiService _apiService;

  CreateEmployeeRepo(this._apiService);

  Future<ApiResult<CreateEmployeeResponse>> createEmployee(
      CreateEmployeeRequest createEmployeeRequest) async {
    try {
      final response = await _apiService.createEmployee(createEmployeeRequest);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ApiErrorHandler.handle(errro));
    }
  }
}