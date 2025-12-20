import 'package:banking_system/features/sign_up/logic/sign_up_cubit.dart';
import 'package:banking_system/features/sign_up/ui/widgets/signup_actions.dart';
import 'package:banking_system/features/sign_up/ui/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final SignupCubit signupCubit;

  @override
  void initState() {
    super.initState();
    signupCubit = context.read<SignupCubit>();
  }

  // Dispose of the cubit when the widget is disposed
  @override
  void dispose() {
    signupCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1100),
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Register New Client Account",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Please fill in all required fields accurately to create the client file.",
                ),

                const SizedBox(height: 30),

                const SignupForm(),

                const SizedBox(height: 40),

                const SignupActionButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
