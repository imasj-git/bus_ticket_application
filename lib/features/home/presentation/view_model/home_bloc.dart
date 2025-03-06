import 'dart:developer';
import 'package:bus_ticket_app/features/home/domain/get_buses_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBusesUseCase _getBusesUseCase;

  HomeBloc({required GetBusesUseCase getBusesUseCase})
      : _getBusesUseCase = getBusesUseCase,
        super(HomeState.initial()) {
    on<LoadBuses>(_onLoadBuses);
  }

  Future<void> _onLoadBuses(
    LoadBuses event,
    Emitter<HomeState> emit,
  ) async {
    log("🔍 Bloc: Loading all buses");
    emit(state.copyWith(isLoading: true));

    final result = await _getBusesUseCase.call();
    result.fold(
      (failure) {
        log("❌ Bloc Error: ${failure.message}");
        emit(state.copyWith(isLoading: false, errorMessage: failure.message));
      },
      (buses) {
        log("✅ Bloc: Received ${buses.length} buses");
        emit(state.copyWith(isLoading: false, buses: buses, errorMessage: null));
      },
    );
  }
}
