
import 'package:banking_system/core/helpers/constants.dart';
import 'package:banking_system/core/shared_widgets/app_text_form_field.dart';
import 'package:banking_system/core/shared_widgets/drop_down.dart';
import 'package:banking_system/features/deposit_or_withdrawal/logic/deposit_or_withdrawal_cubit.dart';
import 'package:banking_system/features/deposit_or_withdrawal/logic/deposit_or_withdrawal_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepositOrWithdrawalForm extends StatelessWidget {
  const DepositOrWithdrawalForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DepositOrWithdrawalCubit>();
    return BlocBuilder<DepositOrWithdrawalCubit, DepositOrWithdrawalState>(
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [
              // account number and transaction type row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: AppTextFormField(
                      hintText: 'Account Number',
                      controller: cubit.accountNumberController,
                      suffixIcon: const Icon(Icons.account_balance_wallet_outlined),
                      validator: (value) => value!.isEmpty ? 'Please enter Account Number' : null,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: AppDropdownField(
                      hintText: 'Transaction Type',
                      items: transactionTypes,
                      value: cubit.selectedTransactionType,
                      onChanged: (val) {
                        cubit.selectedTransactionType = val;
                      },
                      validator: (val) => val == null ? 'Select Transaction Type' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              
              // amount row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: AppTextFormField(
                      hintText: 'Amount',
                      controller: cubit.amountController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      suffixIcon: const Icon(Icons.attach_money),
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Please enter Amount';
                        if (double.tryParse(value) == null || double.parse(value) <= 0) {
                          return 'Enter valid positive amount';
                        }
                        return null;
                      },
                    ),
                  ),
                  const Expanded(child: SizedBox()), 
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
