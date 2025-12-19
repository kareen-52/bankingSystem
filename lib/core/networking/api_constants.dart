class ApiConstants {
  static const String url = "http://10.232.212.190:8000/";

  static const String api = "api/";
  static const String apiBaseUrl = url + api;
  static const String login = "Login";
  static const String signup = "CreateAccount";
  static const String createEmployee = "CreateEmployee";
  static const String depositOrWithdrawal = "DepositOrWithdrawal";
  static const String logout = "Logout";
  static const String transfer = "Transfer";
  static const String depositOrWithdrawalSchedule =
      "DepositOrWithdrawalSchedule";
  static const String transferSchedule = "TransferSchedule";
  static const String searchAccount = "SearchAccount";
  static const String updateAccount = "UpdateAccount/{id}";
  static const String closeAccount = "CloseAccount/{id}";
  static const String getInquiries = "GetInquiries";
}
