import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../data/repo/employee_transactions_repo.dart';
import '../data/models/transactions_response.dart';
import 'employee_transactions_state.dart';

class EmployeeTransactionsCubit extends Cubit<EmployeeTransactionsState> {
  final EmployeeTransactionsRepo _repo;
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  EmployeeTransactionsCubit(this._repo) : super(EmployeeTransactionsInitial());

  Future<void> searchTransactions() async {
    if (!formKey.currentState!.validate()) return;

    emit(EmployeeTransactionsLoading());

    try {
      final response = await _repo.getTransactions(searchController.text.trim());

      // 1. no transactions found
      if (("$response".contains("no transactions"))) {
        emit(EmployeeTransactionsEmpty("{$response}"));
        return;
      }

      // 2. transactions found
      List<TransactionItem> allItems = [];
      allItems.addAll(response.transactions.sent);
      allItems.addAll(response.transactions.received);
      allItems.addAll(response.transactions.deposit);
      allItems.addAll(response.transactions.withdrawal);
    
      if (allItems.isEmpty) {
        emit(EmployeeTransactionsEmpty("No transactions found"));
      } else {
        // Sort transactions by date in descending order
        allItems.sort((a, b) => DateTime.parse(b.date as String).compareTo(DateTime.parse(a.date as String)));
        emit(EmployeeTransactionsSuccess(allItems));
      }

    } on DioException catch (e) {
      // Handle errors returned from the backend (invalid account number)
      if (e.response != null && e.response!.data != null) {
        final data = e.response!.data;
        if (data['message'] != null) {
           // In case of error 422 or 400
          emit(EmployeeTransactionsError(data['message']));
        } else {
          emit(EmployeeTransactionsError("An error occurred. Please try again."));
        }
      } else {
        emit(EmployeeTransactionsError(e.message ?? "Connection error"));
      }
    } catch (e) {
      emit(EmployeeTransactionsError(e.toString()));
    }
  }
}