import 'package:barcode_widget/barcode_widget.dart';
import 'package:bus_ticket_app/core/common/sensor/proximity_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    final isNear = context.watch<ProximityProvider>().isNear; // ✅ Get sensor state

    return Scaffold(
      backgroundColor: isNear ? Colors.black : Colors.white, // ✅ Auto-dim screen
      appBar: AppBar(
        title: Text("My Tickets"),
        backgroundColor: Colors.deepPurple,
      ),

      body: isNear
          ? Container(color: Colors.black) // ✅ Show blank screen when covered
          : Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Departure and Arrival Info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildLocationInfo("KATHMANDU", "Mar 07"),
                        Icon(Icons.directions_bus, color: Colors.grey, size: 24),
                        _buildLocationInfo("POKHARA", "Mar O7"),
                      ],
                    ),
                    Divider(thickness: 1, color: Colors.grey.shade300),
                    SizedBox(height: 10),

                    // Ticket Details
                    _buildTicketRow("Passengers", "2 Adults"),
                    _buildTicketRow("Operator", "Pokhara Greyhound Pvt. Ltd."),
                    _buildTicketRow("Seat No.", "B13, B14"),
                    _buildTicketRow("Ticket No.", "1001"),
                    
                    _buildTicketRow("Ticket Fare", "Rs 1540"),
                    _buildTicketRow("Rest Stops", "1 Stop"),
                    SizedBox(height: 10),

                    // Ticket Status
                    Text(
                      "Ticket Status: CONFIRMED",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                    SizedBox(height: 10),

                    // Barcode
                    Text("Show this to the driver in bus", style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 10),
                    BarcodeWidget(
                      barcode: Barcode.code128(),
                      data: "42Wld94",
                      width: 200,
                      height: 50,
                      drawText: false,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildLocationInfo(String city, String dateTime) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(city, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(dateTime, style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildTicketRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey)),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
