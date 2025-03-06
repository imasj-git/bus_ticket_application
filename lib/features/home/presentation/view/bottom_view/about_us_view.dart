import 'package:bus_ticket_app/core/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.deepPurple,
        title: const Text('About Us', style: TextStyle(fontWeight: FontWeight.bold)),
        iconTheme: IconThemeData(
    color: Colors.white, // ✅ Set back button color to white
  ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerSection(themeProvider),
            SizedBox(height: 20),
            missionAndVisionSection(themeProvider),
            SizedBox(height: 20),
            coreValuesSection(themeProvider),
            SizedBox(height: 20),
            contactInfoSection(themeProvider),
          ],
        ),
      ),
    );
  }

  /// ✅ Company Overview Section
  Widget headerSection(ThemeProvider themeProvider) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode ? Colors.black87 : Colors.deepPurple.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Image.asset(
          //   'assets/company_logo.png', // Replace with actual logo
          //   height: 80,
          // ),
          SizedBox(height: 12),
          Text(
            "Welcome!",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: themeProvider.isDarkMode ? Colors.white : Colors.deepPurple,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "We are dedicated to providing a seamless and comfortable ticket booking experience. "
            "Our platform offers fast, reliable, and secure ticket reservations, ensuring a hassle-free journey for every traveler.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: themeProvider.isDarkMode ? Colors.white70 : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  /// ✅ Mission & Vision Section
  Widget missionAndVisionSection(ThemeProvider themeProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionTitle("Our Mission", themeProvider),
        SizedBox(height: 8),
        Text(
          "To revolutionize the bus ticket booking industry by making it simple, efficient, and accessible to all travelers.",
          style: TextStyle(fontSize: 14, color: themeProvider.isDarkMode ? Colors.white70 : Colors.black87),
        ),
        SizedBox(height: 16),
        sectionTitle("Our Vision", themeProvider),
        SizedBox(height: 8),
        Text(
          "To become the most trusted and customer-centric bus ticketing platform, offering seamless travel experiences across multiple destinations.",
          style: TextStyle(fontSize: 14, color: themeProvider.isDarkMode ? Colors.white70 : Colors.black87),
        ),
      ],
    );
  }

  /// ✅ Core Values Section
  Widget coreValuesSection(ThemeProvider themeProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionTitle("Our Core Values", themeProvider),
        SizedBox(height: 8),
        coreValueItem(Icons.verified, "Customer Satisfaction", "We prioritize customer needs and strive to offer the best service."),
        coreValueItem(Icons.security, "Security & Trust", "Ensuring secure transactions and maintaining transparency."),
        coreValueItem(Icons.speed, "Efficiency", "Making ticket booking fast and effortless for everyone."),
        coreValueItem(Icons.people, "Inclusivity", "Providing equal access to all travelers, regardless of location."),
      ],
    );
  }

  /// ✅ Contact Information Section
  Widget contactInfoSection(ThemeProvider themeProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionTitle("Get in Touch", themeProvider),
        SizedBox(height: 8),
        contactItem(Icons.email, "Email", "support@busticketapp.com"),
        contactItem(Icons.phone, "Phone", "+977-9801234567"),
        contactItem(Icons.location_on, "Address", "Kathmandu, Nepal"),
      ],
    );
  }

  /// ✅ Section Title Styling
  Widget sectionTitle(String title, ThemeProvider themeProvider) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: themeProvider.isDarkMode ? Colors.white : Colors.deepPurple,
      ),
    );
  }

  /// ✅ Core Value Item
  Widget coreValueItem(IconData icon, String title, String description) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(
        title,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        description,
        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
      ),
    );
  }

  /// ✅ Contact Information Item
  Widget contactItem(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(
        label,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        value,
        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
      ),
    );
  }
}
