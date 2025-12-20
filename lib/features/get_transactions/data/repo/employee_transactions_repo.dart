import '../../../../core/networking/api_service.dart';
import '../models/employee_transactions_request.dart';
import '../models/transactions_response.dart';

class EmployeeTransactionsRepo {
  final ApiService _apiService;

  EmployeeTransactionsRepo(this._apiService);

  Future<TransactionsResponse> getTransactions(String accountNumber) async {
    try {
      final response = await _apiService.getTransactionsForEmployee(
        EmployeeTransactionsRequest(accountNumber: accountNumber),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
