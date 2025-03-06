import 'package:bus_ticket_app/core/theme/theme_provider.dart';

import 'package:bus_ticket_app/features/home/presentation/view/bottom_view/about_us_view.dart';
import 'package:bus_ticket_app/features/home/presentation/view/bottom_view/account_settings_view.dart';
import 'package:bus_ticket_app/features/home/presentation/view/bottom_view/faq_view.dart';
import 'package:bus_ticket_app/features/home/presentation/view/bottom_view/terms_and_conditions_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.deepPurple,
        title: const Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: IconButton(
              icon: Icon(Icons.logout, color: Colors.white),
              onPressed: () {
                // Handle logout action
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            profileHeader(themeProvider), // ✅ Full-width Profile Header
            SizedBox(height: 20),
            settingsList(themeProvider, context), // ✅ Pass context for navigation
          ],
        ),
      ),
    );
  }

  /// ✅ Full-Width Profile Header with Dark Mode Support
  Widget profileHeader(ThemeProvider themeProvider) {
    return Container(
      width: double.infinity, // ✅ Full Width
      padding: EdgeInsets.symmetric(vertical: 30),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode ? Colors.black : Colors.deepPurple, // ✅ Dark Mode Support
        borderRadius: BorderRadius.circular(25), // ✅ Custom Rounded Corners
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.white, // White Border
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profile.jpg'), // Replace with user's image
                ),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
                  child: Icon(Icons.camera_alt, color: Colors.deepPurple, size: 18),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "Saurav Joshi",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: themeProvider.isDarkMode ? Colors.white : Colors.white,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "saurav@gmail.com",
            style: TextStyle(
              fontSize: 14,
              color: themeProvider.isDarkMode ? Colors.white70 : Colors.white70,
            ),
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }

  /// ✅ Settings List Section with Dark Mode & Navigation
  Widget settingsList(ThemeProvider themeProvider, BuildContext context) {
    return Column(
      children: [
        settingsItem(Icons.settings, "Account Settings", themeProvider, context, destination: AccountSettingsView()),

        darkModeToggle(themeProvider), // ✅ Dark Mode Toggle
        settingsItem(Icons.info, "About Us", themeProvider, context, destination: AboutUsView()), // ✅ Navigate to AboutUsView
        settingsItem(Icons.question_answer, "Frequently Asked Questions", themeProvider, context, destination: FAQView()),

        settingsItem(Icons.policy, "Terms & Conditions", themeProvider, context, destination: TermsAndConditionsView()),

      ],
    );
  }

  /// ✅ Individual Settings Item with Dark Mode & Navigation Support
  Widget settingsItem(IconData icon, String title, ThemeProvider themeProvider, BuildContext context, {Widget? destination}) {
    return Card(
      color: themeProvider.isDarkMode ? Colors.black : Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: themeProvider.isDarkMode ? 0 : 1,
      child: ListTile(
        leading: Icon(icon, color: themeProvider.isDarkMode ? Colors.white : Colors.deepPurple),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: themeProvider.isDarkMode ? Colors.white70 : Colors.grey),
        onTap: () {
          if (destination != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destination),
            );
          }
        },
      ),
    );
  }

  /// ✅ Dark Mode Toggle Switch
  Widget darkModeToggle(ThemeProvider themeProvider) {
    return Card(
      color: themeProvider.isDarkMode ? Colors.black : Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: themeProvider.isDarkMode ? 0 : 1,
      child: ListTile(
        leading: Icon(Icons.dark_mode, color: themeProvider.isDarkMode ? Colors.white : Colors.deepPurple),
        title: Text(
          "Dark Mode",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        trailing: Switch(
          value: themeProvider.isDarkMode,
          activeColor: Colors.deepPurple,
          onChanged: (value) => themeProvider.toggleTheme(),
        ),
      ),
    );
  }
}
