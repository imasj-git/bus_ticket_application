import 'package:bus_ticket_app/core/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountSettingsView extends StatefulWidget {
  const AccountSettingsView({super.key});

  @override
  _AccountSettingsViewState createState() => _AccountSettingsViewState();
}

class _AccountSettingsViewState extends State<AccountSettingsView> {
  final _formKey = GlobalKey<FormState>();

  // Pre-filled User Info (Replace with actual user data)
  TextEditingController fullNameController = TextEditingController(text: "Saurav Joshi");
  TextEditingController emailController = TextEditingController(text: "saurav@gmail.com");
  TextEditingController phoneController = TextEditingController(text: "+977-9801234567");

  // Password Fields
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false; // Password Visibility Toggle

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.deepPurple,
        title: const Text('Account Settings', style: TextStyle(fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(
          color: Colors.white, // ✅ Set back button color to white
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              sectionTitle("Personal Information", themeProvider),
              const SizedBox(height: 10),
              inputField("Full Name", fullNameController, themeProvider),
              inputField("Email Address", emailController, themeProvider),
              inputField("Phone Number", phoneController, themeProvider),

              const SizedBox(height: 20),

              sectionTitle("Change Password", themeProvider),
              const SizedBox(height: 10),
              passwordField("New Password", newPasswordController, themeProvider),
              passwordField("Confirm Password", confirmPasswordController, themeProvider),

              const SizedBox(height: 20),

              submitButton(themeProvider),
            ],
          ),
        ),
      ),
    );
  }

  /// ✅ Section Title Styling
  Widget sectionTitle(String title, ThemeProvider themeProvider) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: themeProvider.isDarkMode ? Colors.white : Colors.deepPurple,
        ),
      ),
    );
  }

  /// ✅ Editable Input Field with Prefilled Data
  Widget inputField(String label, TextEditingController controller, ThemeProvider themeProvider) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: themeProvider.isDarkMode ? Colors.white : Colors.black),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: themeProvider.isDarkMode ? Colors.white70 : Colors.black87),
          filled: true,
          fillColor: themeProvider.isDarkMode ? Colors.black87 : Colors.grey[200],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) return "This field is required";
          return null;
        },
      ),
    );
  }

  /// ✅ Password Input Field with Visibility Toggle
  Widget passwordField(String label, TextEditingController controller, ThemeProvider themeProvider) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: !_isPasswordVisible,
        style: TextStyle(color: themeProvider.isDarkMode ? Colors.white : Colors.black),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: themeProvider.isDarkMode ? Colors.white70 : Colors.black87),
          filled: true,
          fillColor: themeProvider.isDarkMode ? Colors.black87 : Colors.grey[200],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: themeProvider.isDarkMode ? Colors.white70 : Colors.black54,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
        ),
        validator: (value) {
          if (label == "Confirm Password" && value != newPasswordController.text) {
            return "Passwords do not match";
          }
          if (value!.isEmpty || value.length < 6) {
            return "Password must be at least 6 characters";
          }
          return null;
        },
      ),
    );
  }

  /// ✅ Submit Button
  Widget submitButton(ThemeProvider themeProvider) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Handle Form Submission
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Account settings updated successfully!")),
            );
          }
        },
        child: const Text("Save Changes", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }
}
