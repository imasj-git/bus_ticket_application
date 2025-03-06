import 'package:bus_ticket_app/core/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FAQView extends StatelessWidget {
  const FAQView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.deepPurple,
        title: const Text('FAQs', style: TextStyle(fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(
          color: Colors.white, // ✅ Set back button color to white
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle("Frequently Asked Questions", themeProvider),
            const SizedBox(height: 8),
            sectionContent(
              "Find answers to common questions about our bus ticket booking service.",
              themeProvider,
            ),
            const SizedBox(height: 20),

            // ✅ FAQ List
            faqItem(
              "How do I book a ticket?",
              "You can book a ticket through our app by selecting your route, choosing a bus, and making a payment online.",
              themeProvider,
            ),
            faqItem(
              "Can I cancel my ticket after booking?",
              "Yes, ticket cancellations are allowed based on the bus operator's policy. Refunds will be processed within 7-10 days.",
              themeProvider,
            ),
            faqItem(
              "What payment methods do you accept?",
              "We accept various payment methods including credit/debit cards, digital wallets like Khalti, and net banking.",
              themeProvider,
            ),
            faqItem(
              "How will I receive my ticket?",
              "Once the payment is confirmed, your ticket will be sent to your registered email and can be accessed in the 'My Tickets' section of the app.",
              themeProvider,
            ),
            faqItem(
              "What happens if my bus is delayed?",
              "Bus operators are responsible for any delays. You will be notified via SMS or email about any schedule changes.",
              themeProvider,
            ),
            faqItem(
              "Can I reschedule my trip?",
              "Yes, rescheduling is possible depending on seat availability and the bus operator’s policy. Additional charges may apply.",
              themeProvider,
            ),
            faqItem(
              "Is my payment secure?",
              "Absolutely! We use secure payment gateways to ensure all transactions are safe and encrypted.",
              themeProvider,
            ),
            faqItem(
              "Who should I contact for support?",
              "You can reach out to our support team via email at support@busticketapp.com or call us at +977-9801234567.",
              themeProvider,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// ✅ Section Title Widget
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

  /// ✅ Section Content Widget
  Widget sectionContent(String content, ThemeProvider themeProvider) {
    return Text(
      content,
      style: TextStyle(
        fontSize: 14,
        color: themeProvider.isDarkMode ? Colors.white70 : Colors.black87,
      ),
    );
  }

  /// ✅ Expandable FAQ Item
  Widget faqItem(String question, String answer, ThemeProvider themeProvider) {
    return Card(
      color: themeProvider.isDarkMode ? Colors.black87 : Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: themeProvider.isDarkMode ? 0 : 1,
      child: ExpansionTile(
        iconColor: themeProvider.isDarkMode ? Colors.white : Colors.deepPurple,
        title: Text(
          question,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              answer,
              style: TextStyle(
                fontSize: 14,
                color: themeProvider.isDarkMode ? Colors.white70 : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
