import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:async';

class BusView extends StatefulWidget {
  const BusView({super.key});

  @override
  BusViewState createState() => BusViewState();
}

class BusViewState extends State<BusView> {
  List<Map<String, dynamic>> busTickets = [
    {
      "operator": "Ansett Pioneer",
      "departure": "Kathmandu",
      "departureDate": "08-MAR-2025",
      "destination": "Pokhara",
      "destinationDate": "08-MAR-2025",
      "time": "9:00 AM",
      "price": "Rs800",
    },
    {
      "operator": "Holiday Adventure VIP Sofa",
      "departure": "Pokhara",
      "departureDate": "08-MAR-2025",
      "destination": "Chitwan",
      "destinationDate": "08-MAR-2025",
      "time": "8:00 AM",
      "price": "Rs900",
    },
    {
      "operator": "Yeti Adventure Travels",
      "departure": "Kathmandu",
      "departureDate": "08-MAR-2025",
      "destination": "Pokhara",
      "destinationDate": "08-MAR-2025",
      "time": "10:00 AM",
      "price": "Rs1000",
    },
    {
      "operator": "New Lotus Adventure",
      "departure": "Kathmandu",
      "departureDate": "09-MAR-2025",
      "destination": "Pokhara",
      "destinationDate": "09-MAR-2028",
      "time": "11:00 AM",
      "price": "Rs950",
    },
  ];

  bool isLoading = false; // ✅ Added loading state
  late StreamSubscription<AccelerometerEvent> _accelerometerSubscription;

  @override
  void initState() {
    super.initState();
    _listenToShake();
  }

  @override
  void dispose() {
    _accelerometerSubscription.cancel(); // Stop listening when widget is removed
    super.dispose();
  }

  void _listenToShake() {
    _accelerometerSubscription = accelerometerEventStream().listen((event) {
      double acceleration = event.x.abs() + event.y.abs() + event.z.abs();

      if (acceleration > 20 && !isLoading) { // Prevent multiple refreshes
        _refreshBusList();
      }
    });
  }

  Future<void> _refreshBusList() async {
    setState(() {
      isLoading = true; // Show loading indicator
    });

    await Future.delayed(Duration(seconds: 2)); // Simulate network call

    setState(() {
      busTickets = [
        {
      "operator": "Yeti Adventure Travels",
      "departure": "Kathmandu",
      "departureDate": "08-MAR-2025",
      "destination": "Pokhara",
      "destinationDate": "08-MAR-2025",
      "time": "10:00 AM",
      "price": "Rs1000",
    },
    {
      "operator": "New Lotus Adventure",
      "departure": "Kathmandu",
      "departureDate": "09-MAR-2025",
      "destination": "Pokhara",
      "destinationDate": "09-MAR-2028",
      "time": "11:00 AM",
      "price": "Rs950",
    },
    {
      "operator": "Ansett Pioneer",
      "departure": "Kathmandu",
      "departureDate": "08-MAR-2025",
      "destination": "Pokhara",
      "destinationDate": "08-MAR-2025",
      "time": "9:00 AM",
      "price": "Rs800",
    },
    {
      "operator": "Holiday Adventure VIP Sofa",
      "departure": "Pokhara",
      "departureDate": "08-MAR-2025",
      "destination": "Chitwan",
      "destinationDate": "08-MAR-2025",
      "time": "8:00 AM",
      "price": "Rs900",
    },
      ];
      isLoading = false; // Hide loading indicator
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Bus list refreshed!"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Buses"),
        backgroundColor: Colors.deepPurple,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // ✅ Show loader when refreshing
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: busTickets.length,
              itemBuilder: (context, index) {
                final ticket = busTickets[index];

                return Column(
                  children: [
                    _buildBusTicketCard(ticket),
                    if (index != busTickets.length - 1)
                      Container(
                        height: 30,
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                  ],
                );
              },
            ),
    );
  }

  Widget _buildBusTicketCard(Map<String, dynamic> ticket) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Bus Operator & Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ticket["operator"],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 12),

            // Route with icons
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Icon(Icons.bus_alert_outlined, color: Colors.green),
                    Container(
                      height: 24,
                      width: 2,
                      color: Colors.grey.shade300,
                    ),
                    Icon(Icons.location_on, color: Colors.grey),
                  ],
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Departure
                    Text(
                      ticket["departure"],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ticket["departureDate"],
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 12),
                    // Destination
                    Text(
                      ticket["destination"],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ticket["destinationDate"],
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12),

            // Price & Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Price: ${ticket["price"]}",
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("Buy Ticket", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
