import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  final String? busId;
  final String busNumber;
  final String driverName;
  final String routeId;
  final int capacity;
  final String busType;
  final DateTime date;
  final List<SeatEntity> seats;

  const HomeEntity({
    this.busId,
    required this.busNumber,
    required this.driverName,
    required this.routeId,
    required this.capacity,
    required this.busType,
    required this.date,
    required this.seats,
  });

  @override
  List<Object?> get props => [
        busId,
        busNumber,
        driverName,
        routeId,
        capacity,
        busType,
        date,
        seats,
      ];
}

class SeatEntity extends Equatable {
  final String number;
  final bool booked;

  const SeatEntity({
    required this.number,
    required this.booked,
  });

  @override
  List<Object?> get props => [number, booked];
}
