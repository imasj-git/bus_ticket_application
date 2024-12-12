import 'package:bus_ticket_app/view/landing_page_view.dart';
import 'package:bus_ticket_app/view/login_view.dart';
import 'package:bus_ticket_app/view/signup_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPageView(),
        '/login': (context) => const LoginView(),
         '/signup': (context) => const SignupView(), 
      },
    ),
  );
}
