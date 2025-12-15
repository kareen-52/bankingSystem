import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/update_account_request.dart';
import '../models/update_account_response.dart';

class UpdateAccountRepo {
  final ApiService _apiService;

  UpdateAccountRepo(this._apiService);

  Future<ApiResult<UpdateAccountResponse>> updateAccount({
    required int accountId,
    required UpdateAccountRequest request,
  }) async {
    try {
      final response =
      await _apiService.updateAccount(accountId, request);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ApiErrorHandler.handle(errro));
    }
  }
}
