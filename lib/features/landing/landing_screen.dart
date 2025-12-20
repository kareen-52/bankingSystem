import 'package:banking_system/core/helpers/constants.dart';
import 'package:banking_system/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import '../../../core/routing/routes.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.account_balance_outlined,
                size: 80,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 20),
              Text(
                "Banking System",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Please select the appropriate portal",
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 50),

              Wrap(
                spacing: 30,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: [
                  _buildRoleCard(
                    context,
                    title: "Employee Portal",
                    subtitle: "Manage accounts and clients",
                    icon: Icons.badge_outlined,
                    color: Colors.blueAccent,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.loginScreen,
                        arguments: LoginScreenArgs(
                          portalTitle: 'Employee Portal',
                           // employee access
                          requiredRole: UserRole.employee,
                        ),
                      );
                    },
                  ),
                  _buildRoleCard(
                    context,
                    title: "Admin Portal",
                    subtitle: "Administrative privileges and reports",
                    icon: Icons.admin_panel_settings_outlined,
                    color: Colors.deepPurpleAccent,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.loginScreen,
                        arguments: LoginScreenArgs(
                          portalTitle: 'Admin Portal',
                           // admin access
                          requiredRole:
                              UserRole.manager,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Portal selection card
  Widget _buildRoleCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      hoverColor: color.withOpacity(0.05),
      child: Container(
        width: 300,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 40, color: color),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
