import 'package:bus_ticket_app/view/bus_view.dart';
import 'package:bus_ticket_app/view/home_view.dart';
import 'package:bus_ticket_app/view/setting_view.dart';
import 'package:bus_ticket_app/view/ticket_view.dart';
import 'package:flutter/material.dart';

class DashbordView extends StatefulWidget {
  const DashbordView({super.key});

  @override
  State<DashbordView> createState() => _DashbordViewState();
}

class _DashbordViewState extends State<DashbordView> {
  int _selectedIndex = 0;
  final List<Widget> lstBottomScreen = [
    const HomeView(),
    const TicketView(),
    const BusView(),
    const SettingView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lstBottomScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.amber,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long), label: "Tickets"),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_bus), label: "Bus"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
      ),
    );
  }
}
