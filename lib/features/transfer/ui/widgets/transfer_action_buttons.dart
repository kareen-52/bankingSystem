

import 'package:banking_system/core/shared_widgets/app_text_button.dart';
import 'package:banking_system/features/transfer/logic/transfer_cubit.dart';
import 'package:banking_system/features/transfer/logic/transfer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferActionButtons extends StatelessWidget {
  const TransferActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransferCubit, TransferState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (response) {
            // حالة النجاح 200
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${response.message} Successfully'),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
                width: 400,
              ),
            );
          },
          error: (errorModel) {
            // معالجة جميع الأخطاء (400, 422, etc)
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  errorModel.getAllErrorMessages(),
                ),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                width: 500,
                duration: const Duration(seconds: 4), // وقت أطول للقراءة
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
                  buttonText: "Confirm & Send Transfer",
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  buttonHeight: 55,
                  onPressed: () {
                    context.read<TransferCubit>().emitTransfer();
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