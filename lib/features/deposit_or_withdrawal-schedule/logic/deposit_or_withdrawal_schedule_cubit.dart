import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/networking/api_result.dart';
import '../data/models/deposit_or_withdrawal_schedule_request.dart';
import '../data/repo/deposit_or_withdrawal_schedule_repo.dart';
import 'deposit_or_withdrawal_schedule_state.dart';


class DepositOrWithdrawalScheduleCubit extends Cubit<DepositOrWithdrawalScheduleState> {
  final DepositOrWithdrawalScheduleRepo _depositOrWithdrawalScheduleRepo;
  DepositOrWithdrawalScheduleCubit(this._depositOrWithdrawalScheduleRepo) : super(const DepositOrWithdrawalScheduleState.initial());

  TextEditingController accountNumberController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController transactionTypeController = TextEditingController();
  TextEditingController dataController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitDepositOrWithdrawalScheduleStates() async {
    if (!formKey.currentState!.validate()) return;
    emit(const DepositOrWithdrawalScheduleState.loading());

    final response = await _depositOrWithdrawalScheduleRepo.depositOrWithdrawalSchedule(
        DepositOrWithdrawalScheduleRequest(
          accountNumber: accountNumberController.text.trim(),
          amount: amountController.text.trim(),
           date: dataController.text.trim(),
          transactionType:transactionTypeController.text.trim(),
        )
    );

    response.when(
      success: (data) async {
        emit(DepositOrWithdrawalScheduleState.success(data));
        clearFields();
      },
      failure: (apiErrorModel) {
        emit(DepositOrWithdrawalScheduleState.error(apiErrorModel));
      },
    );
  }

  void clearFields() {
  // Reset form validation state
  formKey.currentState?.reset();

  // Clear text controllers
  accountNumberController.clear();
  amountController.clear();
  transactionTypeController.clear();
  dataController.clear();

  // Re-emit initial state to rebuild UI cleanly
  emit(const DepositOrWithdrawalScheduleState.initial());
}


}
