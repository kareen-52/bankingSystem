import 'package:banking_system/core/di/dependency_injection.dart';
import 'package:banking_system/features/deposit_or_withdrawal-schedule/logic/deposit_or_withdrawal_schedule_cubit.dart';
import 'package:banking_system/features/deposit_or_withdrawal-schedule/ui/DepositOrWithdrawalSchedulePage.dart';
import 'package:banking_system/features/transfer_schedule-schedule/logic/transfer_schedule_cubit.dart';
import 'package:banking_system/features/transfer_schedule-schedule/ui/screens/TransferSchedulePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleMainPage extends StatefulWidget {
  const ScheduleMainPage({super.key});

  @override
  State<ScheduleMainPage> createState() => _ScheduleMainPageState();
}

class _ScheduleMainPageState extends State<ScheduleMainPage> {
  String selected = "deposit_withdrawal";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Schedule Type",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),

        // Dropdown filter
        Container(
          width: 300,
          child: DropdownButtonFormField<String>(
            value: selected,
            decoration: const InputDecoration(
              labelText: "Schedule Type",
              border: OutlineInputBorder(),
            ),
            items: const [
              DropdownMenuItem(
                value: "deposit_withdrawal",
                child: Text("Deposit / Withdraw Schedule"),
              ),
              DropdownMenuItem(
                value: "transfer_schedule",
                child: Text("Transfer Schedule"),
              ),
            ],
            onChanged: (value) {
              setState(() => selected = value!);
            },
          ),
        ),
        const SizedBox(height: 30),

        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: selected == "deposit_withdrawal"
                ? BlocProvider(
                    create: (_) => getIt<DepositOrWithdrawalScheduleCubit>(),
                    child: const DepositOrWithdrawalSchedulePage(),
                  )
                : BlocProvider(
                    create: (_) => getIt<TransferScheduleScheduleCubit>(),
                    child: const TransferSchedulePage(),
                  ),
          ),
        )
      ],
    );
  }
}