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

      // الحالة 1: لا يوجد معاملات (جاءت رسالة فقط)
      if (response.transactions == null || 
         (response!= null && "${response}"!.contains("no transactions"))) {
        emit(EmployeeTransactionsEmpty("{$response}" ?? "No transactions found"));
        return;
      }

      // الحالة 2: يوجد معاملات - دمج القوائم
      List<TransactionItem> allItems = [];
      if (response.transactions != null) {
        if (response.transactions!.sent != null) allItems.addAll(response.transactions!.sent!);
        if (response.transactions!.received != null) allItems.addAll(response.transactions!.received!);
        if (response.transactions!.deposit != null) allItems.addAll(response.transactions!.deposit!);
        if (response.transactions!.withdrawal != null) allItems.addAll(response.transactions!.withdrawal!);
      }

      if (allItems.isEmpty) {
        emit(EmployeeTransactionsEmpty("No transactions found"));
      } else {
        // ترتيب حسب التاريخ (الأحدث أولاً)
        allItems.sort((a, b) => DateTime.parse(b.date as String).compareTo(DateTime.parse(a.date as String)));
        emit(EmployeeTransactionsSuccess(allItems));
      }

    } on DioException catch (e) {
      // معالجة الأخطاء القادمة من الباك إند (مثل رقم الحساب خطأ)
      if (e.response != null && e.response!.data != null) {
        final data = e.response!.data;
        if (data['message'] != null) {
           // في حالة الخطأ 422 أو 400
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