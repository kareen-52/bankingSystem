import 'package:banking_system/features/deposit_or_withdrawal-schedule/data/repo/deposit_or_withdrawal_schedule_repo.dart';
import 'package:banking_system/features/deposit_or_withdrawal-schedule/logic/deposit_or_withdrawal_schedule_cubit.dart';
import 'package:banking_system/features/deposit_or_withdrawal/data/repo/deposit_or_withdrawal_repo.dart';
import 'package:banking_system/features/deposit_or_withdrawal/logic/deposit_or_withdrawal_cubit.dart';
import 'package:banking_system/features/get_transactions/data/repo/employee_transactions_repo.dart';
import 'package:banking_system/features/get_transactions/logic/employee_transactions_cubit.dart';
import 'package:banking_system/features/search_account/data/repo/search_account_repo.dart';
import 'package:banking_system/features/search_account/logic/search_account_cubit.dart';
import 'package:banking_system/features/transfer/domain/transfer_facade.dart';
import 'package:banking_system/features/transfer_schedule-schedule/data/repo/transfer_schedule_repo.dart';
import 'package:banking_system/features/transfer_schedule-schedule/logic/transfer_schedule_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../features/admin/create_employee/data/repos/create_employee_repo.dart';
import '../../features/admin/create_employee/logic/create_employee_cubit.dart';
import '../../features/admin/inquiry/data/repos/inquiries_repo.dart';
import '../../features/admin/inquiry/logic/inquiries_cubit.dart';
import '../../features/login/data/repo/login_repo.dart';
import '../../features/login/logic/login_cubit.dart';
import '../../features/sign_up/data/repos/sign_up_repo.dart';
import '../../features/sign_up/logic/sign_up_cubit.dart';
import '../../features/transfer/data/repo/transfer_repo.dart';
import '../../features/transfer/logic/transfer_cubit.dart';
import '../../features/update_account/data/repos/close_account_repo.dart';
import '../../features/update_account/data/repos/update_account_repo.dart';
import '../../features/update_account/logic/close_account_cubit.dart';
import '../../features/update_account/logic/update_account_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  final dio = await DioFactory.getDio();

  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup client
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  //DepositOrWithdrawal
  getIt.registerLazySingleton<DepositOrWithdrawalRepo>(
    () => DepositOrWithdrawalRepo(getIt()),
  );
  getIt.registerFactory<DepositOrWithdrawalCubit>(
    () => DepositOrWithdrawalCubit(getIt()),
  );

  // Transfer
  getIt.registerLazySingleton<TransferRepo>(() => TransferRepo(getIt()));
  getIt.registerFactory<TransferCubit>(
    () => TransferCubit(getIt<TransferFacade>()),
  );
  getIt.registerLazySingleton<TransferFacade>(() => TransferFacade(getIt()));

  //DepositOrWithdrawalSchedule
  getIt.registerLazySingleton<DepositOrWithdrawalScheduleRepo>(
    () => DepositOrWithdrawalScheduleRepo(getIt()),
  );
  getIt.registerFactory<DepositOrWithdrawalScheduleCubit>(
    () => DepositOrWithdrawalScheduleCubit(getIt()),
  );

  //TransferSchedule
  getIt.registerLazySingleton<TransferScheduleScheduleRepo>(
    () => TransferScheduleScheduleRepo(getIt()),
  );
  getIt.registerFactory<TransferScheduleScheduleCubit>(
    () => TransferScheduleScheduleCubit(getIt()),
  );

  //search
  getIt.registerLazySingleton<SearchAccountRepo>(
    () => SearchAccountRepo(getIt()),
  );
  getIt.registerFactory<SearchAccountCubit>(() => SearchAccountCubit(getIt()));

  // UpdateAccount
  getIt.registerLazySingleton<UpdateAccountRepo>(
    () => UpdateAccountRepo(getIt()),
  );
  getIt.registerFactory<UpdateAccountCubit>(() => UpdateAccountCubit(getIt()));

  // CloseAccount
  getIt.registerLazySingleton<CloseAccountRepo>(
    () => CloseAccountRepo(getIt()),
  );
  getIt.registerFactory<CloseAccountCubit>(() => CloseAccountCubit(getIt()));

  // Inquiries
  getIt.registerLazySingleton<InquiriesRepo>(() => InquiriesRepo(getIt()));
  getIt.registerFactory<InquiriesCubit>(() => InquiriesCubit(getIt()));

  // CreateEmployee
  getIt.registerLazySingleton<CreateEmployeeRepo>(
    () => CreateEmployeeRepo(getIt()),
  );
  getIt.registerFactory<CreateEmployeeCubit>(
    () => CreateEmployeeCubit(getIt()),
  );

  //get employee transactions
  getIt.registerLazySingleton<EmployeeTransactionsRepo>(
    () => EmployeeTransactionsRepo(getIt()),
  );
  getIt.registerFactory<EmployeeTransactionsCubit>(
    () => EmployeeTransactionsCubit(getIt()),
  );
}
