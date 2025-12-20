
import 'package:banking_system/core/shared_widgets/app_text_form_field.dart';
import 'package:banking_system/features/login/logic/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Employee ID (User Number)',
            controller: cubit.userNumberController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Employee ID';
              }
              return null;
            },
            suffixIcon: const Icon(Icons.person_outline),
          ),
          const SizedBox(height: 20),
          
          AppTextFormField(
            hintText: 'Password',
            controller: cubit.passwordController,
            isObscureText: isObscureText,
            suffixIcon: IconButton(
              icon: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter password';
              }
             
              return null;
            },
          ),
        ],
      ),
    );
  }
}