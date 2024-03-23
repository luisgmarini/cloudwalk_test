import 'package:equatable/equatable.dart';

class CityEntity extends Equatable {
  const CityEntity({
    required this.name,
    required this.lat,
    required this.lon,
  });

  final String name;
  final double lat;
  final double lon;

  @override
  List<Object?> get props => [
        name,
        lat,
        lon,
      ];
}
