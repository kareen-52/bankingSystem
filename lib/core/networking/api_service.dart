import 'package:banking_system/features/deposit_or_withdrawal-schedule/data/models/deposit_or_withdrawal_schedule_request.dart';
import 'package:banking_system/features/deposit_or_withdrawal-schedule/data/models/deposit_or_withdrawal_schedule_response.dart';
import 'package:banking_system/features/deposit_or_withdrawal/data/models/deposit_or_withdrawal_request.dart';
import 'package:banking_system/features/deposit_or_withdrawal/data/models/deposit_or_withdrawal_response.dart';
import 'package:banking_system/features/get_transactions/data/models/employee_transactions_request.dart';
import 'package:banking_system/features/get_transactions/data/models/transactions_response.dart';
import 'package:banking_system/features/search_account/data/models/search_account_request.dart';
import 'package:banking_system/features/search_account/data/models/search_account_response.dart';
import 'package:banking_system/features/transfer/data/models/transfer_request.dart';
import 'package:banking_system/features/transfer/data/models/transfer_response.dart';
import 'package:banking_system/features/transfer_schedule-schedule/data/models/transfer_schedule_request.dart';
import 'package:banking_system/features/transfer_schedule-schedule/data/models/transfer_schedule_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../features/admin/create_employee/data/models/create_employee_request.dart';
import '../../features/admin/create_employee/data/models/create_employee_response.dart';

import '../../features/admin/inquiry/data/models/inquiry_response.dart';
import '../../features/login/data/models/login_request.dart';
import '../../features/login/data/models/login_response.dart';
import '../../features/sign_up/data/models/sign_up_request_body.dart';
import '../../features/sign_up/data/models/sign_up_response.dart';
import '../../features/update_account/data/models/close_account_respone.dart';
import '../../features/update_account/data/models/update_account_request.dart';
import '../../features/update_account/data/models/update_account_response.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody);


  @POST(ApiConstants.createEmployee)
  Future<CreateEmployeeResponse> createEmployee(@Body() CreateEmployeeRequest createEmployeeRequest);



  @POST(ApiConstants.depositOrWithdrawal)
  Future<DepositOrWithdrawalResponse> depositOrWithdrawal(
    @Body() DepositOrWithdrawalRequest depositOrWithdrawalRequest,
  );

  @POST(ApiConstants.transfer)
  Future<TransferResponse> transfer(@Body() TransferRequest transferRequest);

  @POST(ApiConstants.depositOrWithdrawalSchedule)
  Future<DepositOrWithdrawalScheduleResponse> depositOrWithdrawalSchedule(
    @Body()
    DepositOrWithdrawalScheduleRequest depositOrWithdrawalScheduleRequest,
  );

  @POST(ApiConstants.transferSchedule)
  Future<TransferScheduleResponse> transferSchedule(
    @Body() TransferScheduleRequest transferScheduleRequest,
  );

  @POST(ApiConstants.searchAccount) 
  Future<SearchAccountResponse> searchAccount(@Body() SearchAccountRequest request);

  @POST(ApiConstants.updateAccount)
  Future<UpdateAccountResponse> updateAccount(
      @Path("id") int accountId,
      @Body() UpdateAccountRequest updateAccountRequest,
      );

  @GET(ApiConstants.closeAccount)
  Future<CloseAccountResponse> closeAccount(@Path("id") int accountId);


  @GET(ApiConstants.getInquiries)
  Future<InquiriesResponse> inquiries();

  @POST("GetTransactionsForEmployee") // تأكد من الرابط كما في الباك إند
  Future<TransactionsResponse> getTransactionsForEmployee(
    @Body() EmployeeTransactionsRequest request,
  );
}

