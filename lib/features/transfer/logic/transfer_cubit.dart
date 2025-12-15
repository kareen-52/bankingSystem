import 'package:banking_system/core/networking/api_error_model.dart';
import 'package:banking_system/features/transfer/data/models/transfer_request.dart';
import 'package:banking_system/features/transfer/logic/transfer_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/networking/api_result.dart';
import '../data/repo/transfer_repo.dart';


class TransferCubit extends Cubit<TransferState> {
  final TransferRepo _transferRepo;
  TransferCubit(this._transferRepo) : super(const TransferState.initial());

  TextEditingController accountNumberReceiverController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController accountNumberSenderController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitTransfer() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    emit(const TransferState.loading());
    final response = await _transferRepo.transfer(
        TransferRequest(
            accountNumberReceiver: accountNumberReceiverController.text,
            amount: amountController.text,
            accountNumberSender: accountNumberSenderController.text
        )
    );

    response.when(
      success: (transferResponse) async {

        // emit(TransferState.success(transferResponse));
      if (transferResponse.success == false) {
          emit(TransferState.error(ApiErrorModel(message: transferResponse.message)));
        } else {
          emit(TransferState.success(transferResponse));
          clearFields();
        }
      },
      failure: (apiErrorModel) {
        emit(TransferState.error(apiErrorModel));
      },
    );
  }


  void clearFields() {
    accountNumberSenderController.clear();
    accountNumberReceiverController.clear();
    amountController.clear();
  }
  
  @override
  Future<void> close() {
    accountNumberSenderController.dispose();
    accountNumberReceiverController.dispose();
    amountController.dispose();
    return super.close();
  }
}
