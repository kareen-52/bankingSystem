import 'package:banking_system/core/networking/api_result.dart';
import 'package:banking_system/core/shared_widgets/app_text_form_field.dart';
import 'package:banking_system/features/transfer/logic/transfer_cubit.dart';
import 'package:banking_system/features/transfer/logic/transfer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferForm extends StatelessWidget {
  const TransferForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TransferCubit>();
    
    return BlocBuilder<TransferCubit, TransferState>(
      buildWhen: (previous, current) => current is Success, 
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [
              // قسم الحسابات (Sender -> Receiver)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // حساب المرسل
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("From Account (Sender)", style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        AppTextFormField(
                          hintText: 'Sender Account Number',
                          controller: cubit.accountNumberSenderController,
                          // keyboardType: TextInputType.number,
                          suffixIcon: const Icon(Icons.outbound_outlined, color: Colors.redAccent),
                          validator: (value) => value!.isEmpty ? 'Sender Account Required' : null,
                          backgroundColor: Colors.red.shade50.withOpacity(0.3), // تمييز بصري خفيف
                        ),
                      ],
                    ),
                  ),
                  
                  // سهم توضيحي في المنتصف
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    child: Icon(Icons.arrow_forward_rounded, color: Colors.grey.shade400, size: 30),
                  ),
                  
                  // حساب المستقبل
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("To Account (Receiver)", style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        AppTextFormField(
                          hintText: 'Receiver Account Number',
                          controller: cubit.accountNumberReceiverController,
                          // keyboardType: TextInputType.number,
                          suffixIcon: const Icon(Icons.download_rounded, color: Colors.green),
                          validator: (value) => value!.isEmpty ? 'Receiver Account Required' : null,
                          backgroundColor: Colors.green.shade50.withOpacity(0.3), // تمييز بصري خفيف
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 30),
              
              // قسم المبلغ
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2, // يأخذ ثلثي المساحة
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Transfer Amount", style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        AppTextFormField(
                          hintText: 'Amount value',
                          controller: cubit.amountController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          suffixIcon: const Icon(Icons.attach_money),
                          validator: (value) {
                            if (value == null || value.isEmpty) return 'Please enter Amount';
                            if (double.tryParse(value) == null || double.parse(value) <= 0) {
                              return 'Invalid value';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 1), // مساحة فارغة للتنسيق
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
