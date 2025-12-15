import 'package:banking_system/core/helpers/constants.dart';
import 'package:banking_system/core/routing/routes.dart';
import 'package:banking_system/features/admin_home_screen/ui/screens/admin_home_screen.dart';
import 'package:banking_system/features/deposit_or_withdrawal-schedule/logic/deposit_or_withdrawal_schedule_cubit.dart';
import 'package:banking_system/features/deposit_or_withdrawal-schedule/ui/screens/DepositOrWithdrawalSchedulePage.dart';
import 'package:banking_system/features/landing/landing_screen.dart';
import 'package:banking_system/features/search_account/logic/search_account_cubit.dart';
import 'package:banking_system/features/sign_up/logic/sign_up_cubit.dart';
import 'package:banking_system/features/sign_up/ui/screens/signup_screen.dart';
import 'package:banking_system/features/transfer_schedule-schedule/logic/transfer_schedule_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/employee_home_screen/ui/screens/employee_home_screen.dart';
import '../../features/login/logic/login_cubit.dart';
import '../../features/login/ui/screens/login_screen.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      
      case Routes.landingScreen:
        return MaterialPageRoute(builder: (_) => const LandingScreen());

      case Routes.loginScreen:
        final args = settings.arguments as LoginScreenArgs;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(
              portalTitle: args.portalTitle,
              requiredRole: args.requiredRole,
            ),
          ),
        );

      case Routes.employeeHomeScreen:
        return MaterialPageRoute(builder: (_) => const EmployeeHomeScreen());

      case Routes.adminHomeScreen:
        return MaterialPageRoute(builder: (_) => const AdminHomeScreen());

      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );

        case Routes.depositOrWithdrawalSchedule:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<DepositOrWithdrawalScheduleCubit>(),
           child: DepositOrWithdrawalSchedulePage (),
          ),
        );

      case Routes.transferSchedule:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<TransferScheduleScheduleCubit>(),
          //  child: const (),
          ),
        );

      case Routes.searchAccount:
        // final args = settings.arguments as ;
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(create: (context) => getIt<SearchAccountCubit>(),
        )
        );
      default:
        return null;
    }
  }
}



class LoginScreenArgs {
  final String portalTitle;
  final UserRole requiredRole;
  
  LoginScreenArgs({required this.portalTitle, required this.requiredRole});
}