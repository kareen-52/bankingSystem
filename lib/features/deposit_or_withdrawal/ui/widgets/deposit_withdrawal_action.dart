import 'package:banking_system/core/shared_widgets/app_text_button.dart';
import 'package:banking_system/features/deposit_or_withdrawal/logic/deposit_or_withdrawal_cubit.dart';
import 'package:banking_system/features/deposit_or_withdrawal/logic/deposit_or_withdrawal_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DepositOrWithdrawalActionButtons extends StatelessWidget {
  const DepositOrWithdrawalActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DepositOrWithdrawalCubit, DepositOrWithdrawalState>(
      listenWhen: (prev, curr) => curr is Success || curr is Error,
      listener: (context, state) {
        state.whenOrNull(
          success: (response) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(response.message),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
              ),
            );
            context.read<DepositOrWithdrawalCubit>().clearFields();
          },
          error: (errorModel) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  errorModel.getAllErrorMessages(),
                  style: const TextStyle(fontFamily: 'Cairo'),
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
                loading: () => const Center(child: CircularProgressIndicator()),
                orElse: () => AppTextButton(
                  buttonText: "Execute Transaction",
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  buttonHeight: 55,
                  onPressed: () {
                    context.read<DepositOrWithdrawalCubit>().emitDepositOrWithdrawalStates();
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}