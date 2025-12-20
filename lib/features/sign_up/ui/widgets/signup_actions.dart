
import 'package:banking_system/core/shared_widgets/app_text_button.dart';
import 'package:banking_system/features/sign_up/logic/sign_up_cubit.dart';
import 'package:banking_system/features/sign_up/logic/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupActionButtons extends StatelessWidget {
  const SignupActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        state.whenOrNull(
          signupSuccess: (response) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${response.message} Successfully'),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
              ),
            );
            // Reset the form after successful signup
             context.read<SignupCubit>().resetForm();
          },
          signupError: (errorModel) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  errorModel.getAllErrorMessages(),
                ),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                width: 500,
              ),
            );
          },
        );
      },
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: state.maybeWhen(
                signupLoading: () => const Center(child: CircularProgressIndicator()),
                orElse: () => AppTextButton(
                  buttonText: "Create Account",
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  buttonHeight: 50,
                  onPressed: () {
                    context.read<SignupCubit>().emitSignupStates();
                  },
                ),
              ),
            ),
            const SizedBox(width: 20),
          
          ],
        );
      },
    );
  }
}