import 'package:flutter/material.dart';

class BusView extends StatelessWidget {
  const BusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Bus',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple),
      body: const Center(
        child: Text(
          'Bus',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
