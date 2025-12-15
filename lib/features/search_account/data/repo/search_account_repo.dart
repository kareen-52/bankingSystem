
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/search_account_request.dart';
import '../models/search_account_response.dart';


class SearchAccountRepo {
  final ApiService _apiService;

  SearchAccountRepo(this._apiService);

  Future<ApiResult<SearchAccountResponse>> searchAccount(String accountNumber) async {
    try {
      final response = await _apiService.searchAccount(
        SearchAccountRequest(accountNumber: accountNumber),
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}