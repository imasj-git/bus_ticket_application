import 'package:bus_ticket_app/features/booking/presentation/view/search_view.dart';
import 'package:bus_ticket_app/features/booking/presentation/view/search_view_day.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class DashboardView extends StatefulWidget {
  final Function(String) onShiftSelected; // Callback function for state management

  const DashboardView({super.key, required this.onShiftSelected});

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  String _selectedFrom = "Kathmandu";
  String _selectedTo = "Pokhara";
  DateTime? _selectedDate;
  String _selectedShift = "Both";

  List<String> locations = ["Kathmandu", "Pokhara", "Baglung", "Chitwan", "Mahendranagar"];

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
              "Hey Saurav! Explore the world with us.",
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
            // Slidable Banner Section
            _buildSlidableBanner(),

            SizedBox(height: 16),

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
                  _buildDropdown("From", _selectedFrom, (String? newValue) {
                    setState(() {
                      _selectedFrom = newValue!;
                    });
                  }),
                  SizedBox(height: 12),
                  _buildDropdown("To", _selectedTo, (String? newValue) {
                    setState(() {
                      _selectedTo = newValue!;
                    });
                  }),
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
        builder: (context) => _selectedShift == "Day" ? SearchViewDay() : SearchView(),
      ),
    );
  },
  child: Center(
    child: Text(
      "Search Buses",
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

  // Slidable Feature Banner
  Widget _buildSlidableBanner() {
    List<Map<String, String>> bannerData = [
      {"image": "assets/images/bus1 image.jpg", "text": "Comfortable & Safe Travel"},
      {"image": "assets/images/bus2.jpg", "text": "Affordable Prices"},
      {"image": "assets/images/bus1 image.jpg", "text": "Book Your Tickets Now"},
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 180, // Adjust height as needed
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.9,
      ),
      items: bannerData.map((data) {
        return Stack(
          children: [
            // Banner Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                data["image"]!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Overlay with Text
            Positioned(
              bottom: 20,
              left: 20,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6), // Semi-transparent background
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  data["text"]!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  // Dropdown Widget
  Widget _buildDropdown(String label, String selectedValue, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey[700])),
        SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: selectedValue,
          onChanged: onChanged,
          items: locations.map((String location) {
            return DropdownMenuItem<String>(
              value: location,
              child: Text(location),
            );
          }).toList(),
          decoration: InputDecoration(
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

  // Date Picker
  Widget _buildDateSelector() {
  return GestureDetector(
    onTap: () async {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2030),
      );

      if (pickedDate != null && pickedDate != _selectedDate) {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    },
    child: Row(
      children: [
        Icon(LucideIcons.calendar, color: Colors.deepPurple),
        SizedBox(width: 10),
        Text(
          _selectedDate != null
              ? "Departure Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}"
              : "Select Departure Date",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

  // Shift Selector
  Widget _buildShiftSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Selected Shift:", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        Row(
          children: ["Day", "Night"].map((shift) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ChoiceChip(
                label: Text(shift),
                selectedColor: Colors.deepPurple,
                backgroundColor: Colors.grey[200],
                labelStyle: TextStyle(color: _selectedShift == shift ? Colors.white : Colors.deepPurple),
                selected: _selectedShift == shift,
                onSelected: (bool selected) {
                  if (selected) {
                    setState(() {
                      _selectedShift = shift;
                    });
                    widget.onShiftSelected(shift);
                  }
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
  
    Widget _buildFrequentDestinations() {
    List<Map<String, String>> destinations = [
      {"name": "Kathmandu - Pokhara", "image": "assets/images/bus.png"},
      {"name": "Kathmandu - Chitwan", "image": "assets/images/bus.png"},
      {"name": "Pokhara - Lumbini", "image": "assets/images/bus.png"},
    ];

    return Column(
      children: destinations.map((destination) {
        return Card(
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            leading: Image.asset(
              destination["image"]!,
              width: 40, // Adjust size as needed
              height: 40,
              fit: BoxFit.contain,
            ),
            title: Text(
              destination["name"]!,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.deepPurple),
            onTap: () {},
          ),
        );
      }).toList(),
    );
  }

}
