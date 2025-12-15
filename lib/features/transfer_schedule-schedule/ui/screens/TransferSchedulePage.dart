import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/transfer_schedule_cubit.dart';
import '../../logic/transfer_schedule_state.dart';

class TransferSchedulePage extends StatefulWidget {
  const TransferSchedulePage({super.key});

  @override
  State<TransferSchedulePage> createState() => _TransferSchedulePageState();
}

class _TransferSchedulePageState extends State<TransferSchedulePage> {


  @override
  Widget build(BuildContext context) {
        final cubit = context.read<TransferScheduleScheduleCubit>();
    return BlocConsumer<
      TransferScheduleScheduleCubit,
      TransferScheduleScheduleState
    >(
      listener: (context, state) {
        if (state is Success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Transfer scheduled successfully!")),
          );
        } else if (state is Error) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error: ${state.apiErrorModel.message}')));
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: cubit.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Transfer Money Schedule",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                _buildField("From Account Number", cubit.accountNumberSender),
                _buildField("To Account Number", cubit.accountNumberReceiver),
                _buildField("Amount", cubit.amountController, isNumber: true),
                _buildField("Date (YYYY-MM-DD)", cubit.dateController),

                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                          onPressed: () {
                      cubit.emitDepositOrWithdrawalScheduleStates();
                    },
                    child: state is Loading
                        ? const CircularProgressIndicator()
                        : const Text("Schedule Transfer"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildField(
    String label,
    TextEditingController controller, {
    bool isNumber = false,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        maxLines: maxLines,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This field is required";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
