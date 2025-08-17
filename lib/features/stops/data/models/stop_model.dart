import 'package:lanes_planes_demo/features/stops/data/models/products_model.dart';
import '../../domain/entities/stop.dart';

class StopModel {
  final String id;
  final String name;
  final double latitude;
  final double longitude;
  final ProductsModel products;

  const StopModel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.products,
  });

  factory StopModel.fromJson(Map<String, dynamic> json) {
    final loc = (json['location'] as Map<String, dynamic>?);
    final lat = (loc?['latitude'] as num?)?.toDouble();
    final lon = (loc?['longitude'] as num?)?.toDouble();

    return StopModel(
      id: json['id'] as String,
      name: json['name'] as String,
      latitude: lat ?? 0.0,
      longitude: lon ?? 0.0,
      products: ProductsModel.fromJson(
        (json['products'] as Map<String, dynamic>?) ?? const {},
      ),
    );
  }

  /// Mapper to domain entity
  Stop toEntity() => Stop(
    id: id,
    name: name,
    latitude: latitude,
    longitude: longitude,
    products: products.toEntity(),
  );
}
