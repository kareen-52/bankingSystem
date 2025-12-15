import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/networking/api_result.dart';
import '../data/models/transfer_schedule_request.dart';
import '../data/repo/transfer_schedule_repo.dart';
import 'transfer_schedule_state.dart';


class TransferScheduleScheduleCubit extends Cubit<TransferScheduleScheduleState> {
  final TransferScheduleScheduleRepo _transferScheduleScheduleRepo;
  TransferScheduleScheduleCubit(this._transferScheduleScheduleRepo) : super(const TransferScheduleScheduleState.initial());

  TextEditingController accountNumberSender = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController accountNumberReceiver = TextEditingController();
  TextEditingController dateController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitDepositOrWithdrawalScheduleStates() async {
   // if (!formKey.currentState!.validate()) return;
    emit(const TransferScheduleScheduleState.loading());

    final response = await _transferScheduleScheduleRepo.transferScheduleSchedule(
        TransferScheduleRequest(

            amount: amountController.text.trim(),
            date: dateController.text.trim(),
            accountNumberSender:accountNumberSender.text.trim(),
            accountNumberReceiver: accountNumberReceiver.text.trim(),
    )
    );

    response.when(
      success: (data) async {
        emit(TransferScheduleScheduleState.success(data));
        clearFields();
      },
      failure: (apiErrorModel) {
        emit(TransferScheduleScheduleState.error(apiErrorModel));
      },
    );
  }

  void clearFields() {
  // Reset form state
  formKey.currentState?.reset();

  // Clear controllers
  accountNumberSender.clear();
  accountNumberReceiver.clear();
  amountController.clear();
  dateController.clear();

  // Reset cubit state
  emit(const TransferScheduleScheduleState.initial());
}


}
