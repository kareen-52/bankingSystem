
import 'package:banking_system/features/update_account/logic/update_account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/networking/api_result.dart';
import '../data/models/update_account_request.dart';
import '../data/repos/update_account_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/update_account_request.dart';
import '../data/repos/update_account_repo.dart';
import 'update_account.dart';
import '../../search_account/data/models/account_details_model.dart';

class UpdateAccountCubit extends Cubit<UpdateAccountState> {
  final UpdateAccountRepo _repo;

  UpdateAccountCubit(this._repo)
      : super(const UpdateAccountState.initial());

  final accountStatusController = TextEditingController();
  final parentAccountController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // 🔹 هذا هو Context في State Pattern
  void prepare(AccountDetailsModel account) {
    final status = account.status?.toLowerCase() ?? "";

    final allowedStatuses = _allowedStatusesFor(status);

    accountStatusController.text = allowedStatuses.first;
    parentAccountController.clear();

    emit(
      UpdateAccountState.updateAccountReady(
        allowedStatuses: allowedStatuses,
        selectedStatus: allowedStatuses.first,
      ),
    );
  }

  // 🔹 قواعد الانتقال بين الحالات (مسموح)
  List<String> _allowedStatusesFor(String status) {
    switch (status) {
      case "active":
        return ["active", "suspended", "frozen"];
      case "suspended":
        return ["suspended", "active", "frozen"];
      case "frozen":
        return ["frozen", "active", "suspended"];
      case "closed":
        return ["closed"];
      default:
        return ["active", "suspended", "frozen"];
    }
  }

  Future<void> updateAccount(int accountId) async {
    if (!formKey.currentState!.validate()) return;

    emit(const UpdateAccountState.updateAccountLoading());

    final request = UpdateAccountRequest(
      accountStatus: accountStatusController.text.trim(),
      parentAccountNumber: parentAccountController.text.trim().isEmpty
          ? null
          : parentAccountController.text.trim(),
    );

    final result = await _repo.updateAccount(
      accountId: accountId,
      request: request,
    );

    result.when(
      success: (data) {
        emit(UpdateAccountState.updateAccountSuccess(data));
      },
      failure: (error) {
        emit(UpdateAccountState.updateAccountError(error));
      },
    );
  }

  void reset() {
    accountStatusController.clear();
    parentAccountController.clear();
    emit(const UpdateAccountState.initial());
  }

  @override
  Future<void> close() {
    accountStatusController.dispose();
    parentAccountController.dispose();
    return super.close();
  }
}
