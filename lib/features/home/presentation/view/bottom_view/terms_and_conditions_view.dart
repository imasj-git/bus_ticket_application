import 'package:bus_ticket_app/core/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.deepPurple,
        title: const Text('Terms & Conditions', style: TextStyle(fontWeight: FontWeight.bold)),
        iconTheme: IconThemeData(
          color: Colors.white, // ✅ Set back button color to white
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle("Welcome", themeProvider),
            SizedBox(height: 8),
            sectionContent(
              "By using our services, you agree to comply with and be bound by the following terms and conditions. "
              "Please read them carefully before using our application.",
              themeProvider,
            ),
            SizedBox(height: 20),

            sectionTitle("1. User Agreement", themeProvider),
            SizedBox(height: 8),
            sectionContent(
              "You must be at least 18 years old to use our services. By using our platform, "
              "you confirm that all the information provided is accurate and truthful.",
              themeProvider,
            ),
            SizedBox(height: 20),

            sectionTitle("2. Booking and Payments", themeProvider),
            SizedBox(height: 8),
            sectionContent(
              "All ticket bookings are subject to seat availability. Once a ticket is booked, "
              "you are responsible for ensuring that the details are correct before proceeding with the payment.",
              themeProvider,
            ),
            SizedBox(height: 20),

            sectionTitle("3. Cancellations & Refunds", themeProvider),
            SizedBox(height: 8),
            sectionContent(
              "Cancellation policies vary based on the operator. Refunds (if applicable) will be processed within 7-10 business days. "
              "We are not responsible for any delays caused by third-party payment processors.",
              themeProvider,
            ),
            SizedBox(height: 20),

            sectionTitle("4. Privacy Policy", themeProvider),
            SizedBox(height: 8),
            sectionContent(
              "We are committed to protecting your privacy. Any personal information collected is used solely for ticket booking and customer support. "
              "Your data will not be shared with third parties without your consent.",
              themeProvider,
            ),
            SizedBox(height: 20),

            sectionTitle("5. Limitation of Liability", themeProvider),
            SizedBox(height: 8),
            sectionContent(
              "We are not responsible for any losses, delays, or damages that may occur during your journey. "
              "It is the responsibility of the bus operator to ensure a safe and timely trip.",
              themeProvider,
            ),
            SizedBox(height: 20),

            sectionTitle("6. Contact Us", themeProvider),
            SizedBox(height: 8),
            contactItem(Icons.email, "Email", "support@busticketapp.com"),
            contactItem(Icons.phone, "Phone", "+977-9801234567"),
            contactItem(Icons.location_on, "Address", "Kathmandu, Nepal"),
          ],
        ),
      ),
    );
  }

  /// ✅ Section Title
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

  /// ✅ Section Content Text
  Widget sectionContent(String content, ThemeProvider themeProvider) {
    return Text(
      content,
      style: TextStyle(
        fontSize: 14,
        color: themeProvider.isDarkMode ? Colors.white70 : Colors.black87,
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
