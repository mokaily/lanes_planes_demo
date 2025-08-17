import 'package:equatable/equatable.dart';
import '../../../stops/domain/entities/products.dart';

class Stop extends Equatable {
  final String id;
  final String name;
  final double latitude;
  final double longitude;
  final Products products;

  const Stop({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.products,
  });

  @override
  List<Object?> get props => [id, name, latitude, longitude, products];
}
