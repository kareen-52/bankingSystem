import 'package:banking_system/features/deposit_or_withdrawal/ui/widgets/deposit_withdrawal_action.dart';
import 'package:banking_system/features/deposit_or_withdrawal/ui/widgets/deposit_withdrawal_form.dart';
import 'package:flutter/material.dart';


class DepositOrWithdrawalScreen extends StatelessWidget {
  const DepositOrWithdrawalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deposit & Withdrawal Operations",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                  "Please enter the account number and transaction type accurately.",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                  ),
                  const Divider(thickness: 1.5, height: 40),
                  
                  const DepositOrWithdrawalForm(),
                  
                  const SizedBox(height: 40),
                  
                  const DepositOrWithdrawalActionButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
