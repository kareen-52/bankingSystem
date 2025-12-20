import 'package:flutter/material.dart';
import '../../core/shared_widgets/dashboard_layout.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<SideMenuItem> items = [
      SideMenuItem(
        title: "Dashboard",
        icon: Icons.analytics_outlined,
        isSelected: _selectedIndex == 0,
        onTap: () => setState(() => _selectedIndex = 0),
      ),
      SideMenuItem(
        title: "Employee Management",
        icon: Icons.people_outline,
        isSelected: _selectedIndex == 1,
        onTap: () => setState(() => _selectedIndex = 1),
      ),
      SideMenuItem(
        title: "Financial Reports",
        icon: Icons.bar_chart_outlined,
        isSelected: _selectedIndex == 2,
        onTap: () => setState(() => _selectedIndex = 2),
      ),
    ];

    return DashboardLayout(
      title: "Manager Dashboard",
      menuItems: items,
      child: Center(
        child: Text(
          "Page Content $_selectedIndex (Under Development)",

          style: const TextStyle(fontSize: 24, color: Colors.grey),
        ),
      ),
    );
  }
}
