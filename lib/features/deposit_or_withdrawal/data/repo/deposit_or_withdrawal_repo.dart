import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/deposit_or_withdrawal_request.dart';
import '../models/deposit_or_withdrawal_response.dart';

class DepositOrWithdrawalRepo {
  final ApiService _apiService;

  DepositOrWithdrawalRepo(this._apiService);

  Future<ApiResult<DepositOrWithdrawalResponse>> depositOrWithdrawal(
    DepositOrWithdrawalRequest depositOrWithdrawalRequest,
  ) async {
    try {
      final response = await _apiService.depositOrWithdrawal(
        depositOrWithdrawalRequest,
      );
      return ApiResult.success(response); // success result
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error)); // error handling
    }
  }
}
