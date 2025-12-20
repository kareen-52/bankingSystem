
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/deposit_or_withdrawal_schedule_request.dart';
import '../models/deposit_or_withdrawal_schedule_response.dart';


class DepositOrWithdrawalScheduleRepo {
  final ApiService _apiService;

  DepositOrWithdrawalScheduleRepo(this._apiService);

  Future<ApiResult<DepositOrWithdrawalScheduleResponse>> depositOrWithdrawalSchedule(
      DepositOrWithdrawalScheduleRequest depositOrWithdrawalScheduleRequest) async {
    try {
      final response = await _apiService.depositOrWithdrawalSchedule(depositOrWithdrawalScheduleRequest);
      return ApiResult.success(response ); // success result
    } catch (errro) {
      return ApiResult.failure(ApiErrorHandler.handle(errro)); // error handling
    }
  }
}
