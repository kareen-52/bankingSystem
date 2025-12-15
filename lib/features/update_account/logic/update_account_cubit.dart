// import 'package:banking_system/core/networking/api_error_model.dart';
// import 'package:banking_system/features/sign_up/logic/update_account.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/cupertino.dart';
// import '../../../core/networking/api_result.dart';
// import '../data/models/update_account_request.dart';
// import '../data/repos/update_account_repo.dart';


// class SignupCubit extends Cubit<SignupState> {
//   final SignupRepo _signupRepo;
//   SignupCubit(this._signupRepo) : super(const SignupState.initial());

//   final userNumberController = TextEditingController();
//   final nationalNumberController = TextEditingController();
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final phoneNumberController = TextEditingController();
//   final locationController = TextEditingController();
//   final balanceController = TextEditingController();
//   final passwordController = TextEditingController();
//   final passwordConfirmController = TextEditingController();
//   final parentAccountNumberController = TextEditingController();

//   String? selectedAccountType;
//   String? selectedAccountHierarchy;
//   bool isParentAccountFieldVisible = false;
//   final formKey = GlobalKey<FormState>();


//   void changeAccountHierarchy(String? value) {
//     selectedAccountHierarchy = value;
//     if (value != null && value != 'individual account') {
//       isParentAccountFieldVisible = true;
//     } else {
//       isParentAccountFieldVisible = false;
//       parentAccountNumberController.clear();
//     }
//     emit(const SignupState.initial());
//   }

//   void emitSignupStates() async {
//     if (!formKey.currentState!.validate()) return;

//     emit(const SignupState.signupLoading());

//     String? parentAccountToSend;

//     if (selectedAccountHierarchy == 'Group Account') {
//       // NOTE: Ensure string matches your dropdown value exactly (Case Sensitive)
//       // If user typed something, send it. If empty, send null.
//       if (parentAccountNumberController.text.trim().isNotEmpty) {
//         parentAccountToSend = parentAccountNumberController.text.trim();
//       } else {
//         parentAccountToSend = null; // Optional: Send null to remove field from JSON
//       }
//     } else {
//       // If Individual, force null
//       parentAccountToSend = null;
//     }

//     final request = SignupRequestBody(
//       userNumber: userNumberController.text,
//       nationalNumber: nationalNumberController.text,
//       phoneNumber: phoneNumberController.text,
//       firstName: firstNameController.text,
//       lastName: lastNameController.text,
//       location: locationController.text,
//       balance: balanceController.text.trim(),
//       password: passwordController.text,
//       passwordConfirmation: passwordConfirmController.text,
//       accountType: selectedAccountType!,
//       accountHierarchy: selectedAccountHierarchy!,

//       // parentAccountNumber: (isParentAccountFieldVisible && parentAccountNumberController.text.isNotEmpty)
//       //     ? parentAccountNumberController.text
//       //     : null,

//       parentAccountNumber: parentAccountToSend,
//     );

//     final response = await _signupRepo.signup(request);

//     response.when(
//       success: (signupResponse) {
//         // emit(SignupState.signupSuccess(signupResponse));
//       if (signupResponse.status == false) {
//           emit(SignupState.signupError(ApiErrorModel(message: signupResponse.message)));
//         } else {
//           emit(SignupState.signupSuccess(signupResponse));
//         }
//       },
//       failure: (apiErrorModel) {
//         emit(SignupState.signupError(apiErrorModel));
//       },
//     );
//   }
// }

import 'package:banking_system/features/update_account/logic/update_account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/networking/api_result.dart';
import '../data/models/update_account_request.dart';
import '../data/repos/update_account_repo.dart';

class UpdateAccountCubit extends Cubit<UpdateAccountState> {
  final UpdateAccountRepo _repo;

  UpdateAccountCubit(this._repo)
      : super(const UpdateAccountState.initial());

  final accountStatusController = TextEditingController();
  final parentAccountController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
      success: (data) => emit(UpdateAccountState.updateAccountSuccess(data)),
      failure: (error) => emit(UpdateAccountState.updateAccountError(error)),
    );
  }

  void reset() {
    formKey.currentState?.reset();
    accountStatusController.clear();
    parentAccountController.clear();
    emit(const UpdateAccountState.initial());
  }
}
