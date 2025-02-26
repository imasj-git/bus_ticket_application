import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Seat Selection State
class SeatState extends Equatable {
  final List<String> selectedSeats;
  final int maxSeats;

  const SeatState({
    this.selectedSeats = const [],
    this.maxSeats = 6, // Max seat selection
  });

  SeatState copyWith({List<String>? selectedSeats}) {
    return SeatState(
      selectedSeats: selectedSeats ?? this.selectedSeats,
      maxSeats: this.maxSeats,
    );
  }

  @override
  List<Object> get props => [selectedSeats, maxSeats];
}

// SeatCubit to Manage State
class SeatCubit extends Cubit<SeatState> {
  SeatCubit() : super(const SeatState());

  void toggleSeatSelection(String seat) {
    final List<String> updatedSeats = List.from(state.selectedSeats);

    if (updatedSeats.contains(seat)) {
      updatedSeats.remove(seat);
    } else {
      if (updatedSeats.length < state.maxSeats) {
        updatedSeats.add(seat);
      }
    }

    emit(state.copyWith(selectedSeats: updatedSeats));
  }

  void resetSeats() {
    emit(state.copyWith(selectedSeats: []));
  }
}
