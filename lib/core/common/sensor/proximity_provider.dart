import 'dart:async';
import 'package:flutter/material.dart';
import 'package:proximity_sensor/proximity_sensor.dart';

class ProximityProvider extends ChangeNotifier {
  bool _isNear = false;
  bool get isNear => _isNear;

  late StreamSubscription<int> _proximitySubscription;

  ProximityProvider() {
    _listenToProximity();
  }

  void _listenToProximity() {
    _proximitySubscription = ProximitySensor.events.listen((event) {
      _isNear = event > 0;
      notifyListeners(); // ✅ Notify all UI components to update
    });
  }

  @override
  void dispose() {
    _proximitySubscription.cancel();
    super.dispose();
  }
}
