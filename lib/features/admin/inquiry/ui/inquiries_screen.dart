import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/inquiry_response.dart';
import '../logic/inquiries_cubit.dart';
import '../logic/inquiries_state.dart';

class InquiriesScreen extends StatelessWidget {
  const InquiriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InquiriesCubit, InquiriesState>(
      listener: (context, state) {
        state.whenOrNull(
          inquiriesSuccess: (data) {
            if (data.inquiries.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("There are no inquiries at the moment."),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () {
            // fetch inquiries
            context.read<InquiriesCubit>().emitCreateEmployeeStates();
            return const Center(child: CircularProgressIndicator());
          },
          inquiriesLoading: () =>
          const Center(child: CircularProgressIndicator()),
          inquiriesSuccess: (data) =>
              _InquiriesList(inquiries: data.inquiries),
          inquiriesError: (error) => Center(
            child: Text(
              "${error.message}",
              style: const TextStyle(color: Colors.red),
            ),
          ),
        );
      },
    );
  }
}

class _InquiriesList extends StatelessWidget {
  final List<Inquiry> inquiries;

  const _InquiriesList({required this.inquiries});

  @override
  Widget build(BuildContext context) {
    if (inquiries.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.mark_email_read_outlined,
              size: 80,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              "There are no inquiries at the moment",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "New inquiries will appear here.",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: inquiries.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final inquiry = inquiries[index];

        return Card(
          elevation: 2,
          child: ListTile(
            leading: const Icon(Icons.report_problem_outlined),
            title: Text(inquiry.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 6),
                Text(inquiry.description),
                const SizedBox(height: 6),
                Text(
                  "User: ${inquiry.user.firstName} ${inquiry.user.lastName}",
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  "Phone: ${inquiry.user.phoneNumber}",
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            trailing: Text(
              inquiry.createdAt.toLocal().toString().split(' ').first,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        );
      },
    );
  }
}
