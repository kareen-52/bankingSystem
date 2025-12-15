
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/networking/api_result.dart';
import '../data/models/create_employee_request.dart';
import '../data/repos/create_employee_repo.dart';
import 'create_employee_state.dart';

class CreateEmployeeCubit extends Cubit<CreateEmployeeState> {
  final CreateEmployeeRepo _createEmployeeRepo;
  CreateEmployeeCubit(this._createEmployeeRepo) : super(const CreateEmployeeState.initial());

  final userNumberController = TextEditingController();
  final nationalNumberController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final locationController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitCreateEmployeeStates() async {
    emit(const CreateEmployeeState.createEmployeeLoading());

    final request = CreateEmployeeRequest(
      userNumber: userNumberController.text,
      nationalNumber: nationalNumberController.text,
      phoneNumber: phoneNumberController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      location: locationController.text,
      password: passwordController.text,
      passwordConfirmation: passwordConfirmController.text,
    );

    final response = await _createEmployeeRepo.createEmployee(request);

    response.when(
      success: (createEmployeeResponse) async {
        emit(CreateEmployeeState.createEmployeeSuccess(createEmployeeResponse));
      },
      failure: (apiErrorModel) {
        emit(CreateEmployeeState.createEmployeeError(apiErrorModel));
      },
    );
  }


  /// Reset form fields and UI state
  void resetForm() {

    formKey.currentState?.reset();
    userNumberController.clear();
    nationalNumberController.clear();
    firstNameController.clear();
    lastNameController.clear();
    phoneNumberController.clear();
    locationController.clear();
    passwordController.clear();
    passwordConfirmController.clear();


  }
}