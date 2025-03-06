import 'package:bus_ticket_app/app/constants/api_endpoints.dart';
import 'package:bus_ticket_app/features/home/data/data_source/home_data_source.dart' show IHomeDataSource;
import 'package:bus_ticket_app/features/home/domain/entity/home_entity.dart' show HomeEntity;
import 'package:dio/dio.dart';

class HomeRemoteDataSource implements IHomeDataSource {
  final Dio _dio;

  HomeRemoteDataSource(this._dio);

  @override
  Future<List<HomeEntity>> getAllBuses() async {
    try {
      Response response = await _dio.get(ApiEndpoints.getAllBuses);
      if (response.statusCode == 200) {
        final dto = GetBusesDTO.fromJson(response.data);
        return BusApiModel.toEntityList(dto.buses);
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.response?.statusCode} - ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  @override
  Future<List<HomeEntity>> getBusesByRoute(String routeId) async {
    try {
      Response response = await _dio.get("${ApiEndpoints.getBusesByRoute}/$routeId");
      if (response.statusCode == 200) {
        final dto = GetBusesDTO.fromJson(response.data);
        return BusApiModel.toEntityList(dto.buses);
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.response?.statusCode} - ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
