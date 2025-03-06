// import 'package:bus_ticket_app/features/home/presentation/view/bottom_view/account_view.dart';
// import 'package:bus_ticket_app/features/home/presentation/view/bottom_view/bus_view.dart';
// import 'package:bus_ticket_app/features/home/presentation/view/bottom_view/ticket_view.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../app/di/di.dart';
// import '../view/bottom_view/dashboard_view.dart';
// import 'home_cubit.dart';

// class HomeState extends Equatable {
//   final int selectedIndex;
//   final List<Widget> views;

//   const HomeState({
//     required this.selectedIndex,
//     required this.views,
//   });

//   // Initial state
//   static HomeState initial() {
//   return HomeState(
//     selectedIndex: 0,
//     views: [
//       BlocProvider(
//         create: (context) => getIt<HomeCubit>(),
//         child: DashboardView(
//           onShiftSelected: (shift) {
//             // Handle shift selection
//           },
//         ),
//       ),
//       TicketView(),
//       BusView(), // ✅ Updated: Show BusView instead of placeholder
//       AccountView(),
//     ],
//   );
// }

//   HomeState copyWith({
//     int? selectedIndex,
//     List<Widget>? views,
//   }) {
//     return HomeState(
//       selectedIndex: selectedIndex ?? this.selectedIndex,
//       views: views ?? this.views,
//     );
//   }

//   @override
//   List<Object?> get props => [selectedIndex, views];
// }

import 'package:bus_ticket_app/features/home/domain/entity/home_entity.dart';
import 'package:equatable/equatable.dart';


class HomeState extends Equatable {
  final List<HomeEntity> buses;
  final bool isLoading;
  final String? errorMessage;

  const HomeState({
    required this.buses,
    required this.isLoading,
    this.errorMessage,
  });

  factory HomeState.initial() {
    return const HomeState(
      buses: [],
      isLoading: false,
      errorMessage: null,
    );
  }

  HomeState copyWith({
    List<HomeEntity>? buses,
    bool? isLoading,
    String? errorMessage,
  }) {
    return HomeState(
      buses: buses ?? this.buses,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [buses, isLoading, errorMessage];
}
