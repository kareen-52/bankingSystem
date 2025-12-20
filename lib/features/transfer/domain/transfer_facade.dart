import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_result.dart';
import '../data/models/transfer_request.dart';
import '../data/models/transfer_response.dart';
import '../data/repo/transfer_repo.dart';

class TransferFacade {
  final TransferRepo _transferRepo;

  TransferFacade(this._transferRepo);

  Future<ApiResult<TransferResponse>> transfer({
    required String senderAccount,
    required String receiverAccount,
    required String amount,
  }) async {
    final request = TransferRequest(
      accountNumberSender: senderAccount,
      accountNumberReceiver: receiverAccount,
      amount: amount,
    );

    final result = await _transferRepo.transfer(request);

    return result.when(
      success: (response) {
        if (response.success == false) {
          return ApiResult.failure(
            ApiErrorModel(message: response.message),
          );
        }
        return ApiResult.success(response);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }
}
