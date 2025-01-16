import 'package:bus_ticket_app/core/theme/app_theme.dart';
import 'package:bus_ticket_app/view/dashbord_view.dart';
import 'package:bus_ticket_app/view/landing_page_view.dart';
import 'package:bus_ticket_app/view/login_view.dart';
import 'package:bus_ticket_app/view/onboarding_screen.dart';
import 'package:bus_ticket_app/view/signup_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: getApplicationTheme(),
      routes: {
        '/': (context) => const LandingPageView(),
        '/starting': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginView(),
        '/signup': (context) => const SignupView(),
        '/dashboard': (context) => const DashbordView(),
      },
    );
  }
}
