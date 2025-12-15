import '../data/models/transactions_response.dart';

abstract class EmployeeTransactionsState {}

class EmployeeTransactionsInitial extends EmployeeTransactionsState {}

class EmployeeTransactionsLoading extends EmployeeTransactionsState {}

class EmployeeTransactionsSuccess extends EmployeeTransactionsState {
  final List<TransactionItem> allTransactions;
  EmployeeTransactionsSuccess(this.allTransactions);
}

class EmployeeTransactionsEmpty extends EmployeeTransactionsState {
  final String message;
  EmployeeTransactionsEmpty(this.message);
}

class EmployeeTransactionsError extends EmployeeTransactionsState {
  final String error;
  EmployeeTransactionsError(this.error);
}