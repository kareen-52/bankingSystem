import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/dependency_injection.dart';
import '../../../core/shared_widgets/app_text_form_field.dart';
import '../../update_account/logic/close_account_cubit.dart';
import '../../update_account/logic/close_account_state.dart';
import '../../update_account/logic/update_account.dart';
import '../../update_account/logic/update_account_cubit.dart';
import '../data/models/account_details_model.dart';
import '../logic/search_account_cubit.dart';
import '../logic/search_account_state.dart';

class SearchAccountScreen extends StatelessWidget {
  const SearchAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const _SearchBarSection(),
            const SizedBox(height: 30),

            const Expanded(child: _SearchResultsSection()),
          ],
        ),
      ),
    );
  }
}

class _SearchBarSection extends StatelessWidget {
  const _SearchBarSection();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchAccountCubit>();
    return Form(
      key: cubit.formKey,
      child: Row(
        children: [
          Expanded(
            child: AppTextFormField(
              hintText: 'Enter Account Number to Search...',
              controller: cubit.searchController,
              suffixIcon: const Icon(Icons.search, color: Colors.grey),
              textInputAction: TextInputAction.search,
              validator: (val) => val!.isEmpty ? 'Required' : null,
            ),
          ),
          const SizedBox(width: 20),
          ElevatedButton.icon(
            icon: const Icon(Icons.search, color: Colors.white),
            label: const Text(
              "Search",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              context.read<SearchAccountCubit>().searchAccount();
            },
          ),
        ],
      ),
    );
  }
}

class _SearchResultsSection extends StatelessWidget {
  const _SearchResultsSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchAccountCubit, SearchAccountState>(
      builder: (context, state) {
        return state.when(
          initial: () => _buildEmptyState(),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error) => _buildErrorState(error.message ?? "Unknown Error"),
          success: (data) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _InfoCard(
                        title: "Total Balance",
                        value: "${data.totalBalance ?? 0}",
                        icon: Icons.account_balance_wallet,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _InfoCard(
                        title: "Interest Value",
                        value: "${data.interest ?? 0}",
                        icon: Icons.trending_up,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _InfoCard(
                        title: "Balance After Interest",
                        value: "${data.newBalanceAfterInterest ?? 0}",
                        icon: Icons.savings,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // 2. Main Account Details
                if (data.mainAccount != null) ...[
                  const Text(
                    "Main Account Details",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _MainAccountCard(account: data.mainAccount!),
                  const SizedBox(height: 30),
                ],

                // 3. Children Accounts Table
                if (data.children != null && data.children!.isNotEmpty) ...[
                  const Text(
                    "Linked Accounts (Children)",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _ChildrenTable(children: data.children!),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.manage_search, size: 100, color: Colors.grey.shade300),
          const SizedBox(height: 20),
          Text(
            "Enter an account number above to view details.",
            style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 80, color: Colors.redAccent),
          const SizedBox(height: 20),
          Text(
            message,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _InfoCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 30),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MainAccountCard extends StatelessWidget {
  final AccountDetailsModel account;
  const _MainAccountCard({required this.account});

  @override
  Widget build(BuildContext context) {
    final updateCubit = context.read<UpdateAccountCubit>();
    final searchCubit = context.read<SearchAccountCubit>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateCubit.prepare(account);
    });

    final statusLower = account.status?.toLowerCase() ?? "";
    final showCloseButton =
        statusLower == "active" || statusLower == "suspended";

    return BlocListener<UpdateAccountCubit, UpdateAccountState>(
      listener: (context, state) {
        state.whenOrNull(
          updateAccountSuccess: (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Account updated successfully!"),
                backgroundColor: Colors.green,
              ),
            );
            searchCubit.searchAccount();
          },
          updateAccountError: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error.message ?? "Failed to update account."),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 40,
                runSpacing: 20,
                children: [
                  _detailItem("Account No", account.accountNumber),
                  _detailItem("Balance", "${account.balance}"),
                  _detailItem("Type", account.type ?? "-"),
                  _detailItem("Hierarchy", account.hierarchy ?? "-"),
                  _detailItem("Status", account.status ?? "-", isStatus: true),
                ],
              ),
              const SizedBox(height: 20),

              /// ✅ الفورم الصحيح – يعتمد فقط على State
              BlocBuilder<UpdateAccountCubit, UpdateAccountState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    updateAccountReady: (allowedStatuses, selectedStatus) {
                      return Form(
                        key: updateCubit.formKey,
                        child: Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: selectedStatus,
                                items: allowedStatuses
                                    .map(
                                      (status) => DropdownMenuItem(
                                        value: status,
                                        child: Text(
                                          status[0].toUpperCase() +
                                              status.substring(1),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: allowedStatuses.length == 1
                                    ? null
                                    : (val) {
                                        updateCubit
                                                .accountStatusController
                                                .text =
                                            val ?? "";
                                      },
                                decoration: const InputDecoration(
                                  labelText: "Account Status",
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                ),
                                validator: (val) => val == null || val.isEmpty
                                    ? "Required"
                                    : null,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                controller: updateCubit.parentAccountController,
                                decoration: const InputDecoration(
                                  labelText: "Parent Account Number (Optional)",
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                if (updateCubit.formKey.currentState
                                        ?.validate() ??
                                    false) {
                                  updateCubit.updateAccount(account.id);
                                }
                              },
                              child: const Text("Update Account"),
                            ),
                          ],
                        ),
                      );
                    },
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),

              const SizedBox(height: 10),

              if (showCloseButton)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () => _showCloseAccountDialog(context, account.id),
                  child: const Text("Close Account"),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // باقي الكود (detail + dialog) بدون تغيير
}

Widget _detailItem(String label, String value, {bool isStatus = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
      const SizedBox(height: 5),
      isStatus
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: value.toLowerCase() == 'active'
                    ? Colors.green.withOpacity(0.1)
                    : Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                value[0].toUpperCase() + value.substring(1),
                style: TextStyle(
                  color: value.toLowerCase() == 'active'
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
    ],
  );
}

void _showCloseAccountDialog(BuildContext context, int accountId) {
  final searchCubit = context.read<SearchAccountCubit>();
  showDialog(
    context: context,
    builder: (dialogContext) {
      return BlocProvider<CloseAccountCubit>(
        create: (_) => getIt<CloseAccountCubit>(),
        child: Builder(
          builder: (innerContext) {
            return AlertDialog(
              title: const Text("Close Account"),
              content: BlocConsumer<CloseAccountCubit, CloseAccountState>(
                listener: (context, state) {
                  state.whenOrNull(
                    closeAccountSuccess: (data) {
                      if (Navigator.canPop(innerContext))
                        Navigator.pop(innerContext);
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(data.message ?? "Account Closed"),
                          ),
                        );
                        searchCubit.searchAccount();
                      }
                    },
                  );
                },
                builder: (context, state) {
                  return state.when(
                    initial: () => const Text(
                      "Are you sure you want to close this account?",
                    ),
                    closeAccountLoading: () =>
                        const Center(child: CircularProgressIndicator()),
                    closeAccountError: (e) => Text(e.message ?? "Error"),
                    closeAccountSuccess: (_) => const SizedBox.shrink(),
                  );
                },
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(innerContext),
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    innerContext.read<CloseAccountCubit>().closeAccount(
                      accountId,
                    );
                  },
                  child: const Text("Confirm"),
                ),
              ],
            );
          },
        ),
      );
    },
  );
}

class _ChildrenTable extends StatelessWidget {
  final List<AccountDetailsModel> children;
  const _ChildrenTable({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: DataTable(
        headingRowColor: MaterialStateProperty.all(Colors.grey.shade50),
        columns: const [
          DataColumn(
            label: Text("ID", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          DataColumn(
            label: Text(
              "Account No",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text("Type", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          DataColumn(
            label: Text(
              "Hierarchy",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              "Balance",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              "Status",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
        rows: children
            .map(
              (child) => DataRow(
                cells: [
                  DataCell(Text("${child.id}")),
                  DataCell(Text(child.accountNumber)),
                  DataCell(Text(child.type ?? "-")),
                  DataCell(Text(child.hierarchy ?? "-")),
                  DataCell(Text("${child.balance}")),
                  DataCell(
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: child.status?.toLowerCase() == 'active'
                            ? Colors.green.withOpacity(0.1)
                            : Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        child.status ?? "-",
                        style: TextStyle(
                          fontSize: 12,
                          color: child.status?.toLowerCase() == 'active'
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
