import 'package:bus_ticket_app/features/booking/presentation/view/checkout_view.dart';
import 'package:flutter/material.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BookingViewState createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  String? selectedBoardingPoint;
  TextEditingController nameController = TextEditingController(text: "Santosh KC");
  TextEditingController phoneController = TextEditingController(text: "9840922949");
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kathmandu - Pokhara',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              '8:56',
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
            tripDetailsCard(),
            boardingPointDropdown(),
            contactDetailsForm(),
            promoCodeSection(),
            selectedSeatSection(),
            proceedButton(),
          ],
        ),
      ),
    );
  }

  Widget tripDetailsCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Trip Details", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("M&S Adventures (Night Tourist Sofa Bus)", style: TextStyle(fontSize: 14)),
            Text("2*2 Sofa Seater", style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget boardingPointDropdown() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Address Details *", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text("Select the nearby boarding and dropping point"),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedBoardingPoint,
              hint: Text("Boarding Point *"),
              onChanged: (value) {
                setState(() {
                  selectedBoardingPoint = value;
                });
              },
              items: ["Thamel", "Kalanki", "New Bus Park"]
                  .map((location) => DropdownMenuItem(value: location, child: Text(location)))
                  .toList(),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget contactDetailsForm() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Contact Details", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("Your ticket and bus details will be sent here"),
            const SizedBox(height: 8),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Full Name *", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: "Phone Number *",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("+977", style: TextStyle(fontSize: 16)),
                ),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email Address", border: OutlineInputBorder()),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
      ),
    );
  }

  Widget promoCodeSection() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Promo Code / Cashback", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("Cashback of Rs. 60 is applied", style: TextStyle(color: Colors.green)),
            const SizedBox(height: 8),
            Row(
              children: [
                Radio(value: true, groupValue: true, onChanged: (value) {}),
                Text("Rs. 60"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget selectedSeatSection() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      color: Colors.deepPurple,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Rs. 1140", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                Text("Rs. 1200", style: TextStyle(color: Colors.white70, fontSize: 14, decoration: TextDecoration.lineThrough)),
              ],
            ),
            Text("Selected Seat(s): B13", style: TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget proceedButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CheckoutView()),
  );
},
        child: Text("PROCEED", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }
}
