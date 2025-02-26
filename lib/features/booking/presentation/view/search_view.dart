import 'package:bus_ticket_app/features/booking/presentation/view/seat_view.dart';
import 'package:flutter/material.dart';

import 'package:lucide_icons_flutter/lucide_icons.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        leading: IconButton(
          icon: Icon(LucideIcons.arrowLeft, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Kathmandu - Pokhara",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(LucideIcons.calendar, color: Colors.white),
            onPressed: () {
              // Handle date selection
            },
          ),
          IconButton(
            icon: Icon(LucideIcons.filter, color: Colors.white),
            onPressed: () {
              // Handle filter options
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Date Selector Row
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: Colors.deepPurple.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // Previous date action
                  },
                  child: Text(
                    "PREV",
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "Wed 26, Feb 2025",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    // Next date action
                  },
                  child: Text(
                    "NEXT",
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          // List of Buses
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12),
              children: [
                _buildBusCard(
                  context,
                  title: "Pokhara Greyhound (Sofa Seater Night Service)",
                  subtitle: "Sofa Seater (NIGHT BUS)",
                  price: "Rs.1600",
                ),
                _buildBusCard(
                  context,
                  title: "Srishti (Super Vip Sofa Offer) Night Service",
                  subtitle: "Air Suspension (NIGHT BUS)",
                  price: "Rs.1300",
                ),
                _buildBusCard(
                  context,
                  title: "Open Visit (Night Service)",
                  subtitle: "Sofa Seater (NIGHT BUS)",
                  price: "Rs.1500 - Rs.1600",
                ),
                _buildBusCard(
                  context,
                  title: "Tahalka (Sofa Night Service From Bhaktapur)",
                  subtitle: "2*1 Sofa Seater (NIGHT BUS)",
                  price: "Rs.1700",
                ),
              ],
            ),
          ),
        ],
      ),

      // Floating Button for Bargain Option
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          // Handle bargain chat action
        },
        icon: Icon(LucideIcons.messageCircle, color: Colors.white),
        label: Text("Bargain"),
      ),
    );
  }

  /// 🆕 Modified `_buildBusCard` to navigate to `SeatView`
  Widget _buildBusCard(BuildContext context, {required String title, required String subtitle, required String price}) {
    return GestureDetector(
      onTap: () {
        // Navigate to `SeatView`
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SeatView()),
        );
      },
      child: Card(
        elevation: 3,
        margin: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bus Title
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),

              // Subtitle
              Text(
                subtitle,
                style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 6),

              // Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  Icon(LucideIcons.arrowRight, color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
