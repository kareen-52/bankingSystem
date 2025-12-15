import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'banking_system.dart';
import 'core/di/dependency_injection.dart';
import 'core/helpers/constants.dart';
import 'core/helpers/extensions.dart';
import 'core/helpers/sharedpreference.dart';
import 'core/routing/app_router.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await checkIfLoggedInUser();  
  runApp(
    OverlaySupport.global(
      child:
      // DevicePreview(
      //   enabled: true,
      //   builder: (context) =>
      BankingSystem(
        appRouter: AppRouter(),
        isUserLoggedIn: isLoggedInUser,
      )
    // ),
  )
  );
}

checkIfLoggedInUser() async {
  String? userToken =
  await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if(!userToken.isNullOrEmpty()){
    isLoggedInUser = true;
  }
  isLoggedInUser = false; 
}