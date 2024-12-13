import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1E78), // Dark blue background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              // Add profile navigation logic here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Section
            const Text(
              "Hey Arthur! 👋",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Explore the world with us.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            // Trip Selection Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Trip Type (Round Trip / One Way)
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Radio(
                              value: true,
                              groupValue: true, // Update this based on logic
                              onChanged: (value) {},
                              activeColor: const Color(0xFF1A1E78),
                            ),
                            const Text("Round Trip"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Radio(
                              value: false,
                              groupValue: true, // Update this based on logic
                              onChanged: (value) {},
                              activeColor: const Color(0xFF1A1E78),
                            ),
                            const Text("One Way"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  // From and To Fields
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "From",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "Kathmandu",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.compare_arrows, color: Colors.grey),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "To",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "Pokhara",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  // Date Picker
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "From",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "02-04-2022",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "To",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "04-05-2022",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Search Button
                  ElevatedButton(
                    onPressed: () {
                      // Add search bus logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF57B660), // Green color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Center(
                      child: Text(
                        "Search Bus",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Frequently Visited Section
            const Text(
              "Frequently Visited 🌴",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Destination 1
                _buildDestinationCard("Chitwan", "12 bus a day"),
                // Destination 2
                _buildDestinationCard("Butwal", "14 bus a day"),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF1A1E78),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: "Tickets"),
          BottomNavigationBarItem(icon: Icon(Icons.directions_bus), label: "Bus"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Add bottom navigation logic
        },
      ),
    );
  }

  Widget _buildDestinationCard(String destination, String busesPerDay) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            destination,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            busesPerDay,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
