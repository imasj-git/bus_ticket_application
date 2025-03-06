import 'dart:io';

import 'package:bus_ticket_app/features/home/domain/entity/home_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';



abstract interface class IHomeRepository {
  /// ✅ Fetch all buses
  Future<Either<Failure, List<HomeEntity>>> getAllBuses();

  /// ✅ Fetch buses by route
  Future<Either<Failure, List<HomeEntity>>> getBusesByRoute(String routeId);
}
