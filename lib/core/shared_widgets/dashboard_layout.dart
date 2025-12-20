import 'dart:convert';
import 'package:banking_system/core/helpers/constants.dart';
import 'package:banking_system/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../core/helpers/sharedpreference.dart';
import '../../core/routing/routes.dart';

// Model for a side menu item
class SideMenuItem {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isSelected;

  SideMenuItem({
    required this.title,
    required this.icon,
    required this.onTap,
    this.isSelected = false,
  });
}

// Dashboard layout widget with sidebar and main content area
class DashboardLayout extends StatelessWidget {
  final List<SideMenuItem> menuItems;
  final Widget child;
  final String title;

  const DashboardLayout({
    super.key,
    required this.menuItems,
    required this.child,
    required this.title,
  });

// Logs out the user by calling the logout API and clearing stored data
  Future<void> logout(BuildContext context) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}',
    };
    var dio = Dio();
    var response = await dio.request(
      ApiConstants.apiBaseUrl + ApiConstants.logout,
      options: Options(method: 'GET', headers: headers),
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      await SharedPrefHelper.clearAllSecuredData();
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.landingScreen,
        (route) => false,
      );
    } else {
      print(response.statusMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FE),
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 280,
            color: Colors.white,
            child: Column(
              children: [
                // Logo Area
                Container(
                  height: 100,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_balance,
                        color: Theme.of(context).primaryColor,
                        size: 30,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Banking System",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),

                // Menu Items
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    itemCount: menuItems.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 5),
                    itemBuilder: (context, index) {
                      final item = menuItems[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: item.isSelected
                              ? Theme.of(context).primaryColor.withOpacity(0.1)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Icon(
                            item.icon,
                            color: item.isSelected
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                          ),
                          title: Text(
                            item.title,
                            style: TextStyle(
                              color: item.isSelected
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey[700],
                              fontWeight: item.isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          onTap: item.onTap,
                        ),
                      );
                    },
                  ),
                ),

                // Logout Button
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.redAccent),
                  title: const Text(
                    "Log Out",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  onTap: () async {
                    logout(context);
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // Main Content Area
          Expanded(
            child: Column(
              children: [
                // Header (App Bar for Dashboard)
                Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      // Admin Profile Icon
                      const CircleAvatar(
                        backgroundColor: Color(0xFFF4F7FE),
                        child: Icon(Icons.person, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                // The dynamic content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
