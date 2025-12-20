import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/close_account_respone.dart';

class CloseAccountRepo {
  final ApiService _apiService;

  CloseAccountRepo(this._apiService);

  Future<ApiResult<CloseAccountResponse>> closeAccount( int accountId)async
  {
    try {
      final response =
      await _apiService.closeAccount(accountId);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ApiErrorHandler.handle(errro));
    }
  }
}
