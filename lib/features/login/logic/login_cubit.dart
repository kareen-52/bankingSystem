import 'package:banking_system/core/helpers/constants.dart';
import 'package:banking_system/core/helpers/sharedpreference.dart';
import 'package:banking_system/core/networking/dio_factory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/networking/api_result.dart';
import '../data/models/login_request.dart';
import '../data/repo/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  final TextEditingController userNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequest(
        userNumber: userNumberController.text,
        password: passwordController.text,
      ),
    );

    response.when(
      success: (loginResponse) async {
        await SharedPrefHelper.setData('role', loginResponse.role);
        await saveUserToken(loginResponse.token);
        emit(LoginState.success(loginResponse));
      },
      failure: (apiErrorModel) {
        emit(LoginState.error(apiErrorModel));
      },
    );
  }

@override
  Future<void> close() {
    userNumberController.dispose();
    passwordController.dispose();
    return super.close();
  }


Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenInHeaderAfterLogin(token);
  }
}
