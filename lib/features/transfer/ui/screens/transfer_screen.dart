import 'package:banking_system/features/transfer/ui/widgets/transfer_action_buttons.dart';
import 'package:banking_system/features/transfer/ui/widgets/transfer_form.dart';
import 'package:flutter/material.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 950),
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
                  // Header
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.compare_arrows_rounded, 
                          size: 30, color: Theme.of(context).primaryColor),
                      ),
                      const SizedBox(width: 15),
                      Text(
                      "Money Transfer Between Accounts",
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                  "Please enter Sender and Receiver details accurately. This operation cannot be undone.",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const Divider(thickness: 1.5, height: 40),
                  
                  // Form
                  const TransferForm(),
                  
                  const SizedBox(height: 40),
                  
                  // Actions
                  const TransferActionButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
