import 'package:banking_system/features/update_account/logic/close_account_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/networking/api_result.dart';
import '../data/repos/close_account_repo.dart';

class CloseAccountCubit extends Cubit<CloseAccountState> {
  final CloseAccountRepo _repo;

  CloseAccountCubit(this._repo)
      : super(const CloseAccountState.initial());

  Future<void> closeAccount(int accountId) async {
    emit(const CloseAccountState.closeAccountLoading());

    final result = await _repo.closeAccount(accountId);

    result.when(
      success: (data) => emit(CloseAccountState.closeAccountSuccess(data)),
      failure: (error) => emit(CloseAccountState.closeAccountError(error)),
    );
  }


}
