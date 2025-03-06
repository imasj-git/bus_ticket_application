import 'package:bus_ticket_app/core/common/sensor/proximity_provider.dart';
import 'package:bus_ticket_app/core/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../view_model/home_cubit.dart';
import '../view_model/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final isNear = context.watch<ProximityProvider>().isNear; // ✅ Proximity Sensor State
    final themeProvider = context.watch<ThemeProvider>(); // ✅ Theme State

    return Scaffold(
      backgroundColor: isNear ? Colors.black : (themeProvider.isDarkMode ? Colors.black : Colors.white), // ✅ Dark Mode + Proximity

      body: isNear
          ? Container(color: Colors.black) // ✅ Show blank screen when covered
          : BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return state.views.elementAt(state.selectedIndex);
              },
            ),

      bottomNavigationBar: isNear
          ? SizedBox.shrink() // ✅ Hide bottom navbar when covered
          : BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.dashboard),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.airplane_ticket),
                      label: 'Tickets',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.directions_bus),
                      label: 'Bus',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Settings',
                    ),
                  ],
                  currentIndex: state.selectedIndex,
                  backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white, // ✅ Dark Mode Support for Navbar
                  selectedItemColor: Colors.deepPurple,
                  unselectedItemColor: themeProvider.isDarkMode ? Colors.white70 : Colors.black, // ✅ Dark Mode Text Colors
                  onTap: (index) {
                    context.read<HomeCubit>().onTabTapped(index);
                  },
                );
              },
            ),
    );
  }
}
