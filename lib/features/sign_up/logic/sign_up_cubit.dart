// import 'package:banking_system/core/networking/api_error_model.dart';
// import 'package:banking_system/features/sign_up/logic/inquiries_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/cupertino.dart';
// import '../../../core/networking/api_result.dart';
// import '../data/models/create_employee_request.dart';
// import '../data/repos/inquiries_repo.dart';


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


import 'package:banking_system/core/networking/api_error_model.dart';
import 'package:banking_system/features/sign_up/logic/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/networking/api_result.dart';
import '../data/models/sign_up_request_body.dart';
import '../data/repos/sign_up_repo.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  final userNumberController = TextEditingController();
  final nationalNumberController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final locationController = TextEditingController();
  final balanceController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final TextEditingController? parentAccountToSend = TextEditingController();

  String? selectedAccountType;
  String? selectedAccountHierarchy;
  bool isParentAccountFieldVisible = false;
  final formKey = GlobalKey<FormState>();

  void changeAccountHierarchy(String? value) {
    selectedAccountHierarchy = value;
    if (value != null && value != 'individual account') {
           print('dani');
      isParentAccountFieldVisible = true;
    } else {
           print('lolo');
      isParentAccountFieldVisible = false;
      parentAccountToSend?.clear();
    }
    emit(const SignupState.initial());
         print('state');
  }

  void emitSignupStates() async {
  

    emit(const SignupState.signupLoading());
     print('fadiLLLL');
     parentAccountToSend;
     print('kareen');
    if (selectedAccountHierarchy == 'group account') {
      print('fadi');
      // NOTE: Ensure string matches your dropdown value exactly (Case Sensitive)
      // If user typed something, send it. If empty, send null.
      if (parentAccountToSend!.text.trim().isNotEmpty) {
     //   parentAccountToSend = parentAccountToSend.text.trim();
      } else {
        // Optional: Send null to remove field from JSON
      }
    } else {
      // If Individual, force null
      
    }

    final request = SignupRequestBody(
      userNumber: userNumberController.text,
      nationalNumber: nationalNumberController.text,
      phoneNumber: phoneNumberController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      location: locationController.text,
      balance: balanceController.text.trim(),
      password: passwordController.text,
      passwordConfirmation: passwordConfirmController.text,
      accountType: selectedAccountType!,
      accountHierarchy: selectedAccountHierarchy!,

      // parentAccountNumber: (isParentAccountFieldVisible && parentAccountNumberController.text.isNotEmpty)
      //     ? parentAccountNumberController.text
      //     : null,
      parentAccountNumber: parentAccountToSend!.text.trim().isNotEmpty
          ? parentAccountToSend!.text.trim()
          : null,
    );

    final response = await _signupRepo.signup(request);

    response.when(
      success: (signupResponse) {
        // emit(SignupState.signupSuccess(signupResponse));
        if (signupResponse.status == false) {
          emit(
            SignupState.signupError(
              ApiErrorModel(message: signupResponse.message),
            ),
          );
        } else {
          emit(SignupState.signupSuccess(signupResponse));
        }
      },
      failure: (apiErrorModel) {
        emit(SignupState.signupError(apiErrorModel));
      },
    );
  }
  


  /// Reset form fields and UI state
  void resetForm() {
    // Reset FormState (if used)
    formKey.currentState?.reset();

    // Clear controllers
    userNumberController.clear();
    nationalNumberController.clear();
    firstNameController.clear();
    lastNameController.clear();
    phoneNumberController.clear();
    locationController.clear();
    balanceController.clear();
    passwordController.clear();
    passwordConfirmController.clear();
    parentAccountToSend?.clear();

    // Reset selections / flags
    selectedAccountType = null;
    selectedAccountHierarchy = null;
    isParentAccountFieldVisible = false;

    // Emit initial state so UI re-builds accordingly
    emit(const SignupState.initial());
  }

}
