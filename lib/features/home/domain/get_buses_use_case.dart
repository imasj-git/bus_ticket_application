import 'package:bus_ticket_app/core/error/failure.dart';
import 'package:bus_ticket_app/features/home/domain/entity/home_entity.dart';
import 'package:bus_ticket_app/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';


class GetBusesUseCase {
  final IHomeRepository homeRepository;

  GetBusesUseCase({required this.homeRepository});

  Future<Either<Failure, List<HomeEntity>>> call() async {
    return await homeRepository.getAllBuses();
  }
}
