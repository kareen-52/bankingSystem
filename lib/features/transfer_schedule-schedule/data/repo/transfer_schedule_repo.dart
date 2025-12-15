
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/transfer_schedule_request.dart';
import '../models/transfer_schedule_response.dart';


class TransferScheduleScheduleRepo {
  final ApiService _apiService;

  TransferScheduleScheduleRepo(this._apiService);

  Future<ApiResult<TransferScheduleResponse>> transferScheduleSchedule(
      TransferScheduleRequest transferScheduleRequest) async {
    try {
      final response = await _apiService.transferSchedule(transferScheduleRequest);
      return ApiResult.success(response );
    } catch (errro) {
      return ApiResult.failure(ApiErrorHandler.handle(errro));
    }
  }
}
