import 'package:bus_ticket_app/features/booking/presentation/view/search_view.dart';
import 'package:flutter/material.dart';

import 'package:lucide_icons_flutter/lucide_icons.dart';

class DashboardView extends StatelessWidget {
  final Function(String)
      onShiftSelected; // Callback function for state management

  const DashboardView({super.key, required this.onShiftSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: Text(
              "Hey Arthur! Explore the world with us.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Input Section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildLocationInput("From", "Kathmandu", LucideIcons.mapPin),
                  SizedBox(height: 12),
                  _buildLocationInput("To", "Pokhara", LucideIcons.mapPin),
                  SizedBox(height: 12),
                  _buildDateSelector(),
                  SizedBox(height: 12),
                  _buildShiftSelector(),
                  SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchView(),
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        "Search Buses",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Frequently Visited Section
            Text(
              "Frequently Visited",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 12),
            _buildFrequentDestinations(),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationInput(String label, String placeholder, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700])),
        SizedBox(height: 6),
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.deepPurple),
            hintText: placeholder,
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateSelector() {
    return Row(
      children: [
        Icon(LucideIcons.calendar, color: Colors.deepPurple),
        SizedBox(width: 10),
        Text(
          "Departure Date: 2025-02-26",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildShiftSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Selected Shift:",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        Row(
          children: [
            _buildShiftOption("Both"),
            _buildShiftOption("Day"),
            _buildShiftOption("Night"),
          ],
        ),
      ],
    );
  }

  Widget _buildShiftOption(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ChoiceChip(
        label: Text(text),
        selectedColor: Colors.deepPurple,
        backgroundColor: Colors.grey[200],
        labelStyle: TextStyle(color: Colors.white),
        onSelected: (bool selected) {
          if (selected) {
            onShiftSelected(text); // Trigger callback to update state
          }
        },
        selected: false,
      ),
    );
  }

  Widget _buildFrequentDestinations() {
    List<Map<String, String>> destinations = [
      {"name": "Kathmandu - Pokhara", "icon": "🚌"},
      {"name": "Kathmandu - Chitwan", "icon": "🚌"},
      {"name": "Pokhara - Lumbini", "icon": "🚌"},
    ];

    return Column(
      children: destinations.map((destination) {
        return Card(
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            leading: Text(destination["icon"]!, style: TextStyle(fontSize: 24)),
            title: Text(destination["name"]!,
                style: TextStyle(fontWeight: FontWeight.w500)),
            trailing: Icon(LucideIcons.chevronRight, color: Colors.deepPurple),
            onTap: () {},
          ),
        );
      }).toList(),
    );
  }
}
