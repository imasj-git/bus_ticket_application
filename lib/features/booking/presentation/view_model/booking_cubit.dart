import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// 🟢 Booking State
class BookingState extends Equatable {
  final List<String> selectedSeats;
  final int totalPrice;
  final String fullName;
  final String phoneNumber;
  final String? email;
  final String? boardingPoint;

  const BookingState({
    this.selectedSeats = const [],
    this.totalPrice = 0,
    this.fullName = "Santosh KC",
    this.phoneNumber = "9840922949",
    this.email,
    this.boardingPoint,
  });

  BookingState copyWith({
    List<String>? selectedSeats,
    int? totalPrice,
    String? fullName,
    String? phoneNumber,
    String? email,
    String? boardingPoint,
  }) {
    return BookingState(
      selectedSeats: selectedSeats ?? this.selectedSeats,
      totalPrice: totalPrice ?? this.totalPrice,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      boardingPoint: boardingPoint ?? this.boardingPoint,
    );
  }

  @override
  List<Object?> get props => [selectedSeats, totalPrice, fullName, phoneNumber, email, boardingPoint];
}

// 🟢 Booking Cubit
class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(const BookingState());

  // 🟢 Set Selected Seats & Price
  void setSelectedSeats(List<String> seats, int pricePerSeat) {
    int totalPrice = seats.length * pricePerSeat;
    emit(state.copyWith(selectedSeats: seats, totalPrice: totalPrice));
  }

  // 🟢 Update Contact Details
  void updateContactDetails(String fullName, String phoneNumber, String? email) {
    emit(state.copyWith(fullName: fullName, phoneNumber: phoneNumber, email: email));
  }

  // 🟢 Set Boarding Point
  void setBoardingPoint(String boardingPoint) {
    emit(state.copyWith(boardingPoint: boardingPoint));
  }

  // 🟢 Reset Booking
  void resetBooking() {
    emit(const BookingState());
  }
}
