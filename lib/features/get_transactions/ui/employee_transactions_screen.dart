import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/employee_transactions_cubit.dart';
import '../logic/employee_transactions_state.dart';
import '../data/models/transactions_response.dart';

class EmployeeTransactionsScreen extends StatelessWidget {
  const EmployeeTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Customer Transactions",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            // Search Section
            _buildSearchSection(context),
            
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),

            // Results Section
            Expanded(
              child: BlocBuilder<EmployeeTransactionsCubit, EmployeeTransactionsState>(
                builder: (context, state) {
                  if (state is EmployeeTransactionsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is EmployeeTransactionsError) {
                    return Center(
                      child: Text(state.error, style: const TextStyle(color: Colors.red, fontSize: 16)),
                    );
                  } else if (state is EmployeeTransactionsEmpty) {
                     return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.inbox, size: 60, color: Colors.grey),
                          const SizedBox(height: 10),
                          Text(state.message, style: const TextStyle(color: Colors.grey, fontSize: 18)),
                        ],
                      ),
                    );
                  } else if (state is EmployeeTransactionsSuccess) {
                    return _buildTransactionsTable(state.allTransactions);
                  }
                  
                  return Center(
                    child: Text(
                      "Enter account number to view transactions",
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildSearchSection(BuildContext context) {
    final cubit = context.read<EmployeeTransactionsCubit>();
    return Form(
      key: cubit.formKey,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextFormField(
              controller: cubit.searchController,
              decoration: InputDecoration(
                labelText: "Account Number",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                prefixIcon: const Icon(Icons.search),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) return "Account Number is required";
                return null;
              },
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton.icon(
            onPressed: () {
              cubit.searchTransactions();
            },
            icon: const Icon(Icons.search, color: Colors.white,),
            label: const Text("Search", style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[800],
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }

 Widget _buildTransactionsTable(List<TransactionItem> transactions) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: MaterialStateProperty.all(Colors.grey[100]),
        columns: const [
          DataColumn(label: Text("ID", style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text("Type", style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text("Amount", style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text("Date", style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text("Status", style: TextStyle(fontWeight: FontWeight.bold))),
        ],
        rows: transactions.map((item) {
          return DataRow(cells: [
            DataCell(Text(item.id.toString())),
            DataCell(Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(_getIconForType(item.type), size: 16, color: _getColorForType(item.type)),
                const SizedBox(width: 8),
                Text(item.type.toUpperCase()),
              ],
            )),
            DataCell(Text(
              "${item.amount} SYP",
              style: TextStyle(
                color: _getColorForType(item.type),
                fontWeight: FontWeight.bold,
              ),
            )),
            
            // convert DateTime to string before splitting
            DataCell(Text(item.date.toIso8601String().split('T')[0])), 
            
            DataCell(Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text("Success", style: TextStyle(color: Colors.green, fontSize: 12)),
            )),
          ]);
        }).toList(),
      ),
    );
  }

  IconData _getIconForType(String type) {
    switch (type.toLowerCase()) {
      case 'deposit': return Icons.arrow_downward;
      case 'received': return Icons.call_received;
      case 'withdrawal': return Icons.arrow_upward;
      case 'transfer': return Icons.compare_arrows;
      default: return Icons.monetization_on;
    }
  }

  Color _getColorForType(String type) {
    switch (type.toLowerCase()) {
      case 'deposit': 
      case 'received':
        return Colors.green;
      case 'withdrawal': 
      case 'transfer':
        return Colors.red;
      default: return Colors.black;
    }
  }
}