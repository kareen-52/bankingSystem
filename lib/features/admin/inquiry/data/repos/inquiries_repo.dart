import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';
import '../models/inquiry_response.dart';


class InquiriesRepo {
  final ApiService _apiService;

  InquiriesRepo(this._apiService);

  Future<ApiResult<InquiriesResponse>> inquiries() async {
    try {
      final response = await _apiService.inquiries();
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ApiErrorHandler.handle(errro));
    }
  }
}