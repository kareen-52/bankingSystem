import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/networking/api_result.dart';
import '../data/models/inquiry_response.dart';
import '../data/repos/inquiries_repo.dart';
import 'inquiries_state.dart';

class InquiriesCubit extends Cubit<InquiriesState> {
  final InquiriesRepo _inquiriesState;
  InquiriesCubit(this._inquiriesState) : super(const InquiriesState.initial());
  void emitCreateEmployeeStates() async {
    emit(const InquiriesState.inquiriesLoading());

    final response = await _inquiriesState.inquiries();

    response.when(
      success: (inquiriesResponse) {
        emit(InquiriesState.inquiriesSuccess(inquiriesResponse));
      },
      failure: (apiErrorModel) {
        if (apiErrorModel.message == 'There are no inquiries') {
          emit(
            InquiriesState.inquiriesSuccess(InquiriesResponse(inquiries: [])),
          );
        } else {
          emit(InquiriesState.inquiriesError(apiErrorModel));
        }
      },
    );
  }
}
