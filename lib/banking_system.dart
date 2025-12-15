import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

class BankingSystem extends StatelessWidget {
  final AppRouter appRouter;
  final bool isUserLoggedIn;
  const BankingSystem({super.key, required this.appRouter, required this.isUserLoggedIn});

  @override
  Widget build(BuildContext context) {
    return
    MaterialApp(
        title: 'Banking System',
        debugShowCheckedModeBanner: false,
        initialRoute: 
        Routes.landingScreen,
        // isUserLoggedIn ? Routes.homeScreen : Routes.loginScreen,
        onGenerateRoute: appRouter.generateRoute,


        theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFF0D47A1),  
        colorScheme: ColorScheme.fromSwatch().copyWith(
        // colorScheme: ColorScheme.fromSeed(
          // seedColor: const Color(0xFF0D47A1),
          primary: const Color(0xFF0D47A1),
          surface: Colors.white,
          onPrimary: Colors.white,
          error: Colors.redAccent,
          secondary: const Color(0xFF42A5F5),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),

      
      locale: const Locale('en'), 
      supportedLocales: const [Locale('en')],
      
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],


    );
  }
}
