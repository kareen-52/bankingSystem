import 'package:banking_system/core/networking/api_error_model.dart';
import 'package:banking_system/features/transfer/data/models/transfer_request.dart';
import 'package:banking_system/features/transfer/domain/transfer_facade.dart';
import 'package:banking_system/features/transfer/logic/transfer_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/networking/api_result.dart';
import '../data/repo/transfer_repo.dart';


class TransferCubit extends Cubit<TransferState> {
  final TransferFacade _transferFacade;

  TransferCubit(this._transferFacade)
      : super(const TransferState.initial());

  TextEditingController accountNumberReceiverController =
      TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController accountNumberSenderController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitTransfer() async {
    if (!formKey.currentState!.validate()) return;

    emit(const TransferState.loading());

    final result = await _transferFacade.transfer(
      senderAccount: accountNumberSenderController.text,
      receiverAccount: accountNumberReceiverController.text,
      amount: amountController.text,
    );

    result.when(
      success: (data) {
        emit(TransferState.success(data));
        clearFields();
      },
      failure: (error) {
        emit(TransferState.error(error));
      },
    );
  }

  void clearFields() {
    accountNumberSenderController.clear();
    accountNumberReceiverController.clear();
    amountController.clear();
  }
}
