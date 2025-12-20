import 'package:banking_system/core/shared_widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/create_employee_cubit.dart';
import '../logic/create_employee_state.dart';

class CreateEmployeeScreen extends StatefulWidget {
  const CreateEmployeeScreen({super.key});

  @override
  State<CreateEmployeeScreen> createState() => _CreateEmployeeScreenState();
}

class _CreateEmployeeScreenState extends State<CreateEmployeeScreen> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateEmployeeCubit>();

    return BlocConsumer<CreateEmployeeCubit, CreateEmployeeState>(
      listener: (context, state) {
        state.whenOrNull(
          createEmployeeSuccess: (data) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(data.message ?? "Employee Created")),
            );
            context.read<CreateEmployeeCubit>().resetForm();
          },
          createEmployeeError: (error) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('${error.message}')));
          },
        );
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: cubit.formKey,
            child: ListView(
              children: [
                AppTextFormField(
                  controller: cubit.userNumberController,

                  validator: (value) =>
                      value == null || value.isEmpty ? "Required" : null,
                  hintText: 'User Number',
                ),
                const SizedBox(height: 20),
                AppTextFormField(
                  controller: cubit.nationalNumberController,

                  validator: (value) =>
                      value == null || value.isEmpty ? "Required" : null,
                  hintText: 'National Number',
                ),
                const SizedBox(height: 20),
                AppTextFormField(
                  controller: cubit.firstNameController,

                  validator: (value) =>
                      value == null || value.isEmpty ? "Required" : null,
                  hintText: 'First Name',
                ),
                const SizedBox(height: 20),
                AppTextFormField(
                  controller: cubit.lastNameController,

                  validator: (value) =>
                      value == null || value.isEmpty ? "Required" : null,
                  hintText: 'Last Name',
                ),
                const SizedBox(height: 20),
                AppTextFormField(
                  controller: cubit.phoneNumberController,

                  validator: (value) =>
                      value == null || value.isEmpty ? "Required" : null,
                  hintText: 'Phone Number',
                ),
                const SizedBox(height: 20),
                AppTextFormField(
                  controller: cubit.locationController,

                  validator: (value) =>
                      value == null || value.isEmpty ? "Required" : null,
                  hintText: 'Location',
                ),
                const SizedBox(height: 20),
                AppTextFormField(
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
                  validator: (value) =>
                      value == null || value.isEmpty ? "Required" : null,
                  hintText: 'Password',
                ),

                const SizedBox(height: 20),
                AppTextFormField(
                  controller: cubit.passwordConfirmController,
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
                  validator: (value) =>
                      value == null || value.isEmpty ? "Required" : null,
                  hintText: 'Confirm Password',
                ),

                const SizedBox(height: 20),
                state.maybeWhen(
                  createEmployeeLoading: () =>
                      const Center(child: CircularProgressIndicator()),
                  orElse: () => ElevatedButton(
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.emitCreateEmployeeStates();
                      }
                    },
                    child: const Text("Create Employee"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
