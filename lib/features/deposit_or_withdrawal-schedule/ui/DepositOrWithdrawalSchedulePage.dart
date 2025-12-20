import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/deposit_or_withdrawal_schedule_cubit.dart';
import '../logic/deposit_or_withdrawal_schedule_state.dart';

class DepositOrWithdrawalSchedulePage extends StatelessWidget {
  const DepositOrWithdrawalSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DepositOrWithdrawalScheduleCubit>();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: cubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Deposit / Withdrawal Form",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            TextFormField(
              controller: cubit.accountNumberController,
              decoration: const InputDecoration(
                labelText: "Account Number",
                border: OutlineInputBorder(),
              ),
              validator: (value) => value!.isEmpty ? "Required" : null,
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: cubit.amountController,
              decoration: const InputDecoration(
                labelText: "Amount",
                border: OutlineInputBorder(),
              ),
              validator: (value) => value!.isEmpty ? "Required" : null,
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: cubit.transactionTypeController,
              decoration: const InputDecoration(
                labelText: "Transaction Type (deposit / withdrawal)",
                border: OutlineInputBorder(),
              ),
              validator: (value) => value!.isEmpty ? "Required" : null,
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: cubit.dataController,
              decoration: const InputDecoration(
                labelText: "Date (YYYY-MM-DD)",
                border: OutlineInputBorder(),
              ),
              validator: (value) => value!.isEmpty ? "Required" : null,
            ),
            const SizedBox(height: 30),

            BlocBuilder<
              DepositOrWithdrawalScheduleCubit,
              DepositOrWithdrawalScheduleState
            >(
              builder: (context, state) {
                if (state is Loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      cubit.emitDepositOrWithdrawalScheduleStates();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text("Submit", style: TextStyle(fontSize: 16)),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
