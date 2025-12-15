
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/transfer_request.dart';
import '../models/transfer_response.dart';


class TransferRepo {
  final ApiService _apiService;

  TransferRepo(this._apiService);

  Future<ApiResult<TransferResponse>> transfer(
      TransferRequest transferRequest) async {
    try {
      final response = await _apiService.transfer(transferRequest);
      return ApiResult.success(response );
    } catch (errro) {
      return ApiResult.failure(ApiErrorHandler.handle(errro));
    }
  }
}
