import 'package:bus_ticket_app/core/error/failure.dart';
import 'package:bus_ticket_app/features/home/data/data_source/home_data_source.dart';
import 'package:bus_ticket_app/features/home/domain/entity/home_entity.dart';
import 'package:bus_ticket_app/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRemoteRepository implements IHomeRepository {
  final IHomeDataSource remoteDataSource;

  HomeRemoteRepository({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<HomeEntity>>> getAllBuses() async {
    try {
      final buses = await remoteDataSource.getAllBuses();
      return Right(buses);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HomeEntity>>> getBusesByRoute(String routeId) async {
    try {
      final buses = await remoteDataSource.getBusesByRoute(routeId);
      return Right(buses);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
