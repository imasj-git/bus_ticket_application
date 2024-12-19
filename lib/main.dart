import 'package:bus_ticket_app/core/aap_theme/app_theme.dart';
import 'package:bus_ticket_app/view/home_view.dart';
import 'package:bus_ticket_app/view/landing_page_view.dart';
import 'package:bus_ticket_app/view/login_view.dart';
import 'package:bus_ticket_app/view/onboarding_screen.dart';
import 'package:bus_ticket_app/view/signup_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: getApplicationTheme(),
      routes: {
        '/': (context) => const LandingPageView(),
        '/starting': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginView(),
        '/signup': (context) => const SignupView(),
        '/home': (context) => const HomeView(),
      },
    ),
  );
}
