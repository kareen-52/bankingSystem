import 'package:banking_system/features/deposit_or_withdrawal/data/models/deposit_or_withdrawal_request.dart';
import 'package:banking_system/features/deposit_or_withdrawal/data/repo/deposit_or_withdrawal_repo.dart';
import 'package:banking_system/features/deposit_or_withdrawal/logic/deposit_or_withdrawal_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/networking/api_result.dart';

class DepositOrWithdrawalCubit extends Cubit<DepositOrWithdrawalState> {
  final DepositOrWithdrawalRepo _depositOrWithdrawalRepo;
  DepositOrWithdrawalCubit(this._depositOrWithdrawalRepo)
    : super(const DepositOrWithdrawalState.initial());

  // form controllers
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController transactionTypeController = TextEditingController();

  String? selectedTransactionType;  // deposit / withdrawal

  final formKey = GlobalKey<FormState>();

  void emitDepositOrWithdrawalStates() async {
    if (!formKey.currentState!.validate()) return;
    emit(const DepositOrWithdrawalState.loading());

    final typeToSend = selectedTransactionType == 'deposit'
        ? 'deposit'
        : 'withdrawal';
    final response = await _depositOrWithdrawalRepo.depositOrWithdrawal(
      DepositOrWithdrawalRequest(
        accountNumber: accountNumberController.text.trim(),
        amount: amountController.text.trim(),
        transactionType: typeToSend,
      ),
    );

    response.when(
      success: (data) async {
        emit(DepositOrWithdrawalState.success(data));
        clearFields();
      },
      failure: (apiErrorModel) {
        emit(DepositOrWithdrawalState.error(apiErrorModel));
      },
    );
  }

// Clear form fields
  void clearFields() {
    accountNumberController.clear();
    amountController.clear();
    selectedTransactionType = null;
  }
}
