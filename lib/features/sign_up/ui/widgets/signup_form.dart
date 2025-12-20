import 'package:banking_system/core/helpers/constants.dart';
import 'package:banking_system/core/shared_widgets/app_text_form_field.dart';
import 'package:banking_system/core/shared_widgets/drop_down.dart';
import 'package:banking_system/features/sign_up/logic/sign_up_cubit.dart';
import 'package:banking_system/features/sign_up/logic/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
      bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();


    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. personal information
              _buildSectionTitle(context, "Personal Information"),
              const SizedBox(height: 15),
              _buildTwoColumnRow(
                first: AppTextFormField(
                  hintText: 'First Name',
                  controller: cubit.firstNameController,
                  validator: (val) => val!.isEmpty ? 'Required' : null,
                  suffixIcon: const Icon(Icons.person_outline),
                ),
                second: AppTextFormField(
                  hintText: 'Last Name',
                  controller: cubit.lastNameController,
                  validator: (val) => val!.isEmpty ? 'Required' : null,
                  suffixIcon: const Icon(Icons.person_outline),
                ),
              ),
              const SizedBox(height: 15),
              _buildTwoColumnRow(
                first: AppTextFormField(
                  hintText: 'National ID',
                  controller: cubit.nationalNumberController,
                  keyboardType: TextInputType.number,
                  validator: (val) => val!.isEmpty ? 'Required' : null,
                  suffixIcon: const Icon(Icons.badge_outlined),
                ),
                second: AppTextFormField(
                  hintText: 'Address',
                  controller: cubit.locationController,
                  validator: (val) => val!.isEmpty ? 'Required' : null,
                  suffixIcon: const Icon(Icons.location_on_outlined),
                ),
              ),
              const SizedBox(height: 15),
              _buildTwoColumnRow(
                 first: AppTextFormField(
                  hintText: 'Phone Number (09xxxxxxxx)',
                  controller: cubit.phoneNumberController,
                  keyboardType: TextInputType.phone,
                  validator: (val) => val!.isEmpty ? 'Required' : null,
                  suffixIcon: const Icon(Icons.phone_android_outlined),
                ),
                second: const SizedBox(),
              ),

              const SizedBox(height: 30),

              // 2. account configuration
              _buildSectionTitle(context, "Bank Account Configuration "),
              const SizedBox(height: 15),
              _buildTwoColumnRow(
                first: AppTextFormField(
                  hintText: 'User Number / Account Number',
                  controller: cubit.userNumberController,
                  keyboardType: TextInputType.number,
                  validator: (val) => val!.isEmpty ? 'Required' : null,
                  suffixIcon: const Icon(Icons.account_balance_wallet_outlined),
                ),
                second: AppTextFormField(
                  hintText: 'Opening Balance',
                  controller: cubit.balanceController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  validator: (val) {
                    if (val == null || val.isEmpty) return 'Required';
                    if (double.tryParse(val) == null) return 'Must be a valid number';
                    return null;
                  },
                  suffixIcon: const Icon(Icons.attach_money),
                ),
              ),
              const SizedBox(height: 15),
              _buildTwoColumnRow(
                first: AppDropdownField(
                  hintText: 'Account Type',
                  items: accountTypes, // Global List from constants
                  value: cubit.selectedAccountType,
                  onChanged: (val) => cubit.selectedAccountType = val,
                  validator: (val) => val == null ? 'Please Select' : null,
                ),
                second: AppDropdownField(
                  hintText: 'Account Hierarchy',
                  items: accountHierarchies, // Global List from constants
                  value: cubit.selectedAccountHierarchy,
                  onChanged: (val) => cubit.changeAccountHierarchy(val),
                  validator: (val) => val == null ? 'Please Select' : null,
                ),
              ),
              
              if (cubit.isParentAccountFieldVisible) ...[
                const SizedBox(height: 15),
                 AppTextFormField(
                  hintText: 'Parent Account Number (Optional)',
                  controller: cubit.parentAccountToSend,
                  validator: (val) => {},
                  backgroundColor: Colors.amber.shade50, 
                ),
              ],

              const SizedBox(height: 30),

              // 3. security settings
              _buildSectionTitle(context, "Security Settings"),
              const SizedBox(height: 15),
              _buildTwoColumnRow(
                first: AppTextFormField(
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
                second: AppTextFormField(
                  hintText: 'Confirm Password',
                  controller: cubit.passwordConfirmController,
                  isObscureText: isObscureText,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                return 'Please confirm password';
              }
                    if (val != cubit.passwordController.text) return 'Passwords do not match';
                    return null;
                  },
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Helper Widget for Section Titles
  Widget _buildSectionTitle(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: 5),
        Container(width: 50, height: 3, color: Theme.of(context).primaryColor),
      ],
    );
  }

  // Helper Widget for Web Grid (2 columns)
  Widget _buildTwoColumnRow({required Widget first, required Widget second}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: first),
        const SizedBox(width: 20),
        Expanded(child: second),
      ],
    );
  }
}