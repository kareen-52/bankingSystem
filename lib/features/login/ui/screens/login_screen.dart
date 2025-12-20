import 'package:banking_system/core/helpers/constants.dart';
import 'package:banking_system/core/shared_widgets/app_text_button.dart';
import 'package:banking_system/features/login/ui/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/login_cubit.dart';
import '../../logic/login_state.dart';
import '../../../../core/routing/routes.dart';

class LoginScreen extends StatefulWidget {
  final String portalTitle;
  final UserRole requiredRole;

  const LoginScreen({
    super.key, 
    required this.portalTitle, 
    required this.requiredRole
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<LoginCubit>();
    cubit.userNumberController.addListener(_validateInputs);
    cubit.passwordController.addListener(_validateInputs);
  }

// Validates input fields to enable/disable login button
  void _validateInputs() {
    final cubit = context.read<LoginCubit>();
    final isValid =
        cubit.userNumberController.text.trim().isNotEmpty &&
        cubit.passwordController.text.isNotEmpty;

    if (isValid != isButtonEnabled) {
      setState(() {
        isButtonEnabled = isValid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: 450,
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.account_balance,
                      size: 40,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
      
                Text(
                  widget.portalTitle,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Enter your credentials to continue',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
                ),
                const SizedBox(height: 40),
      
                const LoginForm(),
      
                const SizedBox(height: 40),
      
                _buildLoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }


// Builds the BlocListener and BlocBuilder for login states
  Widget _buildLoginBlocListener() {
    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          success: (loginResponse) {
            if (loginResponse.role != widget.requiredRole.value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Sorry, you are not authorized to access this portal.",
                      style: TextStyle(fontFamily: 'Cairo'),
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
             }
             if (loginResponse.role == UserRole.employee.value) {
               Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.employeeHomeScreen, 
                  (route) => false,
               );
             } 
             else if (loginResponse.role == UserRole.manager.value) {
               Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes. employeeHomeScreen,
                  (route) => false,
               );
             }
          },
          error: (errorModel) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  errorModel.message ?? "An error occurred",
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontFamily: 'Cairo'),
                ),
                backgroundColor: Colors.redAccent,
                behavior: SnackBarBehavior.floating,
                width: 400,
              ),
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          orElse: () => AppTextButton(
            buttonText: "Log In",
            buttonHeight: 55,
            textStyle: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            onPressed: isButtonEnabled
                ? () {
                    context.read<LoginCubit>().emitLoginStates();
                  }
                : () {},
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        );
      },
    );
  }
}
