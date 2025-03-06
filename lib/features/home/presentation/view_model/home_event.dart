import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

/// ✅ Load all buses
class LoadBuses extends HomeEvent {
  const LoadBuses();
}

/// ✅ Load buses by route
class LoadBusesByRoute extends HomeEvent {
  final String routeId;

  const LoadBusesByRoute(this.routeId);

  @override
  List<Object?> get props => [routeId];
}
