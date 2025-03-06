import 'package:equatable/equatable.dart';
import 'package:food_delivery_application/features/home/domain/entity/home_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bus_api_model.g.dart';

@JsonSerializable()
class BusApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? busId;
  final String busNumber;
  final String driverName;
  final String route;
  final int capacity;
  final String busType;
  final DateTime date;
  final List<SeatApiModel> seats;

  const BusApiModel({
    this.busId,
    required this.busNumber,
    required this.driverName,
    required this.route,
    required this.capacity,
    required this.busType,
    required this.date,
    required this.seats,
  });

  /// Convert API model to domain entity
  HomeEntity toEntity() {
    return HomeEntity(
      busId: busId,
      busNumber: busNumber,
      driverName: driverName,
      routeId: route,
      capacity: capacity,
      busType: busType,
      date: date,
      seats: seats.map((seat) => seat.toEntity()).toList(),
    );
  }

  /// Convert JSON to Model
  factory BusApiModel.fromJson(Map<String, dynamic> json) =>
      _$BusApiModelFromJson(json);

  /// Convert Model to JSON
  Map<String, dynamic> toJson() => _$BusApiModelToJson(this);

  /// Convert List of API models to List of Entities
  static List<HomeEntity> toEntityList(List<BusApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [busId, busNumber, driverName, route, capacity, busType, date, seats];
}

@JsonSerializable()
class SeatApiModel extends Equatable {
  final String number;
  final bool booked;

  const SeatApiModel({
    required this.number,
    required this.booked,
  });

  SeatEntity toEntity() => SeatEntity(number: number, booked: booked);

  factory SeatApiModel.fromJson(Map<String, dynamic> json) => _$SeatApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeatApiModelToJson(this);

  @override
  List<Object?> get props => [number, booked];
}
