import 'package:bus_ticket_app/features/booking/presentation/view/booking_view.dart';
import 'package:bus_ticket_app/features/booking/presentation/view_model/booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bus_ticket_app/features/booking/presentation/view_model/seat_cubit.dart';

import 'package:lucide_icons_flutter/lucide_icons.dart';

class SeatView extends StatelessWidget {
  final List<String> bookedSeats = [
    "A1",
    "A2",
    "B7",
    "B8",
    "B11",
    "B12"
  ]; // Already booked seats
  final int seatPrice = 800; // Price per seat

  final List<String> seatLayout = [
    "A1",
    "A2",
    "",
    "B1",
    "B2",
    "A3",
    "A4",
    "",
    "B3",
    "B4",
    "A5",
    "A6",
    "",
    "B5",
    "B6",
    "A7",
    "A8",
    "",
    "B7",
    "B8",
    "A9",
    "A10",
    "",
    "B9",
    "B10",
    "A11",
    "A12",
    "",
    "B11",
    "B12",
    "A13",
    "A14",
    "",
    "B13",
    "B14",
    "A15",
    "A16",
    "",
    "B15",
    "B16",
    "A17",
    "A18",
    "",
    "B17",
    "B18",
    "A19",
    "",
    "",
    "",
    ""
  ];

  SeatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SeatCubit(),
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          leading: IconButton(
            icon: Icon(LucideIcons.arrowLeft, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kathmandu - Pokhara",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "M&S Adventures (Night Tourist Sofa Bus)",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              Text(
                "Wed 26, Feb 2025 , 07:25 PM",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(LucideIcons.bus, color: Colors.white),
              onPressed: () {
                // Handle bus details action
              },
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 10),

            // Legend (Booked & Selected Seats)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildLegend(Colors.grey, "Booked"),
                  SizedBox(width: 10),
                  _buildLegend(Colors.blue, "Selected"),
                ],
              ),
            ),
            SizedBox(height: 10),

            // 🆕 Wrap with `Expanded` and `SingleChildScrollView` to prevent overflow
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Driver Seat
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 20, bottom: 10),
                            child: Icon(
                              LucideIcons.lifeBuoy,
                              size: 32,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        // 🆕 Clickable Seats using `BlocBuilder`
                        BlocBuilder<SeatCubit, SeatState>(
                          builder: (context, state) {
                            return GridView.builder(
                              shrinkWrap:
                                  true, // Prevents infinite height issue
                              physics:
                                  NeverScrollableScrollPhysics(), // GridView inside ScrollView
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5, // 4 seats + 1 empty space
                                childAspectRatio: 1.2,
                              ),
                              itemCount: seatLayout.length,
                              itemBuilder: (context, index) {
                                String seat = seatLayout[index];
                                if (seat.isEmpty) return SizedBox.shrink();

                                bool isBooked = bookedSeats.contains(seat);
                                bool isSelected =
                                    state.selectedSeats.contains(seat);

                                return GestureDetector(
                                  onTap: isBooked
                                      ? null // Ignore taps on booked seats
                                      : () => context
                                          .read<SeatCubit>()
                                          .toggleSeatSelection(seat),
                                  child: _buildSeat(seat, isBooked, isSelected),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // 🆕 Bottom Section: Show Price Calculation or Default Text
            BlocBuilder<SeatCubit, SeatState>(
              builder: (context, state) {
                int totalPrice = state.selectedSeats.length * seatPrice;
                bool hasSelection = state.selectedSeats.isNotEmpty;

                return Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.deepPurple,
                  child: hasSelection
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Total Price
                            Text(
                              "Total: Rs. $totalPrice",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            // Book Now Button
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                      create: (context) => BookingCubit()
                                        ..setSelectedSeats(
                                            state.selectedSeats, seatPrice),
                                      child: BookingView(),
                                    ),
                                  ),
                                );

                                // Handle booking
                              },
                              child: Text(
                                "Book Now",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                      : Center(
                          child: Text(
                            "You can select up to 6 seats.",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegend(Color color, String label) {
    return Row(
      children: [
        Container(width: 20, height: 20, color: color),
        SizedBox(width: 6),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildSeat(String seat, bool isBooked, bool isSelected) {
    return Column(
      children: [
        Icon(
          LucideIcons.armchair,
          size: 30,
          color: isBooked
              ? Colors.grey
              : isSelected
                  ? Colors.blue
                  : Colors.black,
        ),
        Text(seat, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
