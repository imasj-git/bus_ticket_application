import 'package:flutter/material.dart';

class LandingPageView extends StatelessWidget {
  const LandingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Adjust the background color if necessary
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Section
            Image.asset(
              'assets/images/logo.png', // Replace with your logo's asset path
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            // Title Section
            const Text(
              'TICKET SEWA',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 10),
            // Subtitle Section
            const Text(
              'Explore the world with us.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            // Loading Indicator
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Change color if needed
            ),
          ],
        ),
      ),
    );
  }
}
