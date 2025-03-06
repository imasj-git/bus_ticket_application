
import 'package:bus_ticket_app/features/home/data/model/bus_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class GetBusesDTO {
  final bool success;
  final int count;

  @JsonKey(name: "data")
  final List<BusApiModel> buses;

  GetBusesDTO({
    required this.success,
    required this.count,
    required this.buses,
  });

  factory GetBusesDTO.fromJson(Map<String, dynamic> json) =>
      _$GetBusesDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetBusesDTOToJson(this);
}
