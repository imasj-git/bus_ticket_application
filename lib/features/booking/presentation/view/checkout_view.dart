import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment Options',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple, // Set theme color
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              '9:00',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bookingDetailsCard(),
            paymentDetailsCard(),
            khaltiPaymentOption(),
            payButton(),
          ],
        ),
      ),
    );
  }

  Widget bookingDetailsCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Booking Details", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            bookingDetailRow("Route", "Kathmandu - Pokhara"),
            bookingDetailRow("Seats", "B13"),
            bookingDetailRow("Operator Name", "MNS Tours & Travels Pvt. Ltd."),
            bookingDetailRow("Travel Date", "2025-02-26"),
            bookingDetailRow("Travel Time", "07:25 PM"),
          ],
        ),
      ),
    );
  }

  Widget bookingDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title :", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
          Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget paymentDetailsCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Payment Details", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            paymentDetailRow("Total Seats", "1"),
            paymentDetailRow("Requested Price", "Rs. 1200"),
            paymentDetailRow("Discount Amount", "Rs. 60"),
            Divider(),
            paymentDetailRow("Final Price", "Rs. 1140", isBold: true),
          ],
        ),
      ),
    );
  }

  Widget paymentDetailRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          Text(value, style: TextStyle(fontSize: 14, fontWeight: isBold ? FontWeight.bold : FontWeight.w500)),
        ],
      ),
    );
  }

  Widget khaltiPaymentOption() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: GestureDetector(
        onTap: () {
          // Handle Khalti Payment Logic
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          padding: EdgeInsets.all(10),
          child: Center(
            child: Image.asset(
              'assets/images/khalti.png', // Make sure to add Khalti logo in assets
              height: 50,
            ),
          ),
        ),
      ),
    );
  }

  Widget payButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple, // Set theme color
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: () {
          // Handle Payment Logic
        },
        child: Text("Pay Rs. 1140", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }
}
