

import 'package:bus_ticket_app/features/home/domain/entity/home_entity.dart' show HomeEntity;

abstract interface class IHomeDataSource {
  /// ✅ Fetch all buses from the remote source
  Future<List<HomeEntity>> getAllBuses();

  /// ✅ Fetch buses by route ID from the remote source
  Future<List<HomeEntity>> getBusesByRoute(String routeId);
}
