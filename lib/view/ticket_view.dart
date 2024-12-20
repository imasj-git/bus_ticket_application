import 'package:flutter/material.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Ticket',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple),
      body: const Center(
        child: Text(
          'Ticket',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
