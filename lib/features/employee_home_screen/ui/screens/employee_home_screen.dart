import 'package:banking_system/features/deposit_or_withdrawal-schedule/logic/deposit_or_withdrawal_schedule_cubit.dart';
import 'package:banking_system/features/deposit_or_withdrawal-schedule/ui/screens/DepositOrWithdrawalSchedulePage.dart';
import 'package:banking_system/features/deposit_or_withdrawal/logic/deposit_or_withdrawal_cubit.dart';
import 'package:banking_system/features/deposit_or_withdrawal/ui/screens/deposit_or_withdrawal_screen.dart';
import 'package:banking_system/features/get_transactions/logic/employee_transactions_cubit.dart';
import 'package:banking_system/features/get_transactions/ui/screens/employee_transactions_screen.dart';
import 'package:banking_system/features/search_account/logic/search_account_cubit.dart';
import 'package:banking_system/features/search_account/ui/screens/search_account_screen.dart';
import 'package:banking_system/features/transfer/logic/transfer_cubit.dart';
import 'package:banking_system/features/transfer/ui/screens/transfer_screen.dart';
import 'package:banking_system/features/transfer_schedule-schedule/ui/screens/scheduleMainPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/sharedpreference.dart';
import '../../../../core/shared_widgets/dashboard_layout.dart';
import '../../../admin/create_employee/logic/create_employee_cubit.dart';
import '../../../admin/create_employee/ui/screens/create_employee_screen.dart';
import '../../../admin/inquiry/logic/inquiries_cubit.dart';
import '../../../admin/inquiry/ui/screens/inquiries_screen.dart';
import '../../../sign_up/logic/sign_up_cubit.dart';
import '../../../sign_up/ui/screens/signup_screen.dart';
import '../../../update_account/logic/update_account_cubit.dart';

class EmployeeHomeScreen extends StatefulWidget {
  const EmployeeHomeScreen({super.key});

  @override
  State<EmployeeHomeScreen> createState() => _EmployeeHomeScreenState();
}

class _EmployeeHomeScreenState extends State<EmployeeHomeScreen> {
  // للتحكم في الصفحة المعروضة حالياً
  int _selectedIndex = 0;
  int? userRole;

  @override
  void initState() {
    super.initState();
    _loadUserRole();
  }

  Future<void> _loadUserRole() async {
    final role = await SharedPrefHelper.getInt(SharedPrefKeys.role);
    setState(() {
      userRole = role;
    });
  }
  bool get isAdmin => userRole == 3;
  @override
  Widget build(BuildContext context) {



    // قائمة العناصر
    final List<SideMenuItem> items = [
      SideMenuItem(
        title: "Overview",
        icon: Icons.dashboard_outlined,
        isSelected: _selectedIndex == 0,
        onTap: () => setState(() => _selectedIndex = 0),
      ),
      SideMenuItem(
        title: "Create Client Account",
        icon: Icons.person_add_alt_1_outlined,
        isSelected: _selectedIndex == 1,
        onTap: () => setState(() => _selectedIndex = 1),
      ),

      SideMenuItem(
        title: "Deposit / Withdraw",
        icon: Icons.monetization_on_outlined,
        isSelected: _selectedIndex == 2,
        onTap: () => setState(() => _selectedIndex = 2),
      ),
      SideMenuItem(
        title: "Transfer Money",
        icon: Icons.compare_arrows_rounded,
        isSelected: _selectedIndex == 3,
        onTap: () => setState(() => _selectedIndex = 3),
      ),
      SideMenuItem(
        title: "Schedule",
        icon: Icons.schedule_outlined,
        isSelected: _selectedIndex == 4,
        onTap: () => setState(() => _selectedIndex = 4),
      ),
      SideMenuItem(
        title: "Search Account",
        icon: Icons.search,
        isSelected: _selectedIndex == 5,
        onTap: () => setState(() => _selectedIndex = 5),
      ),
      if (isAdmin)
        SideMenuItem(
          title: "Create Employee",
          icon: Icons.admin_panel_settings_outlined,
          isSelected: _selectedIndex == 6,
          onTap: () => setState(() => _selectedIndex = 6),
        ),
      if (isAdmin)
        SideMenuItem(
          title: "Inquiries",
          icon: Icons.support_agent_outlined,
          isSelected: _selectedIndex == 7,
          onTap: () => setState(() => _selectedIndex = 7),
        ),

        SideMenuItem(
        title: "Client Transactions",
        icon: Icons.list_alt,
        isSelected: _selectedIndex == 8, // Index جديد
        onTap: () => setState(() => _selectedIndex = 8),
      ),

    ];

    return DashboardLayout(
      title: _getTitle(_selectedIndex),
      menuItems: items,
      child: _buildContent(_selectedIndex),
    );
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return "Dashboard Overview";
      case 1:
        return "Create Client Account";
      case 2:
        return "Financial Operations";
      case 3:
        return "Money Transfer";
      case 4:
        return "Schedule";
      case 5:
        return "Search Account";
      case 6:
        return "Create Employee";
      case 7:
        return "User Inquiries";
      case 8:
        return "Client Transactions History";

      default:
        return "";
    }
  }

  Widget _buildContent(int index) {
    switch (index) {
      case 0:
        return const _EmployeeDashboardOverview();
      case 1:
        // هنا نقوم بحقن الكيوبت الخاص بإنشاء الحساب
        // ونستدعي شاشة الـ Signup التي برمجناها سابقاً
        return BlocProvider(
          create: (context) => getIt<SignupCubit>(),
          // ملاحظة: SignupScreen لديك فيها Scaffold و AppBar
          // يفضل إما تعديل SignupScreen لتكون بدون Scaffold عند استخدامها هنا
          // أو استخدامها كما هي (ستعمل ولكن سيكون هناك 2 AppBars)
          // الأفضل: جعل SignupScreen مرنة (Responsive)
          child: const SignupScreen(),
        );

      case 2:
        // إضافة شاشة الإيداع والسحب مع الكيوبت الخاص بها
        return BlocProvider(
          create: (context) => getIt<DepositOrWithdrawalCubit>(),
          child: const DepositOrWithdrawalScreen(),
        );

      case 3:
        return BlocProvider(
          create: (context) => getIt<TransferCubit>(),
          child: const TransferScreen(),
        );

      case 4:
        return const ScheduleMainPage();

      case 5:
        // return SearchAccountScreen();
        return MultiBlocProvider(
          providers: [
            BlocProvider<SearchAccountCubit>(
              create: (_) => getIt<SearchAccountCubit>(),
            ),
            BlocProvider<UpdateAccountCubit>(
              create: (_) => getIt<UpdateAccountCubit>(),
            ),
          ],
          child: const SearchAccountScreen(),
        );
//    case 6:
//       if (!isAdmin) {
//         return const Center(child: Text("Unauthorized"));
//       }
//       return BlocProvider(
//         create: (_) => getIt<CreateEmployeeCubit>(),
//         child: const CreateEmployeeScreen(),
//       );
      case 6:
        return BlocProvider(
          create: (_) => getIt<CreateEmployeeCubit>(),
          child: const CreateEmployeeScreen(),
        );
      case 7:

        return BlocProvider(
          create: (_) => getIt<InquiriesCubit>(),
          child: const InquiriesScreen(),
        );

        case 8:
        return BlocProvider(
          create: (context) => getIt<EmployeeTransactionsCubit>(),
          child: const EmployeeTransactionsScreen(),
        );

      default:
        return const Center(child: Text("Page Not Found"));
    }
  }
}

// ودجت بسيطة لصفحة الرئيسية للموظف
class _EmployeeDashboardOverview extends StatelessWidget {
  const _EmployeeDashboardOverview();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.work_outline, size: 100, color: Colors.grey.shade300),
          const SizedBox(height: 20),
          Text(
            "Welcome to Employee Dashboard",
            style: TextStyle(fontSize: 22, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 10),
          const Text("Select an operation from the sidebar to start."),
        ],
      ),
    );
  }
}
