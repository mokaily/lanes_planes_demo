import '../../../stops/domain/entities/products.dart';

class ProductsModel {
  final bool suburban;
  final bool subway;
  final bool tram;
  final bool bus;
  final bool ferry;
  final bool express;
  final bool regional;

  const ProductsModel({
    required this.suburban,
    required this.subway,
    required this.tram,
    required this.bus,
    required this.ferry,
    required this.express,
    required this.regional,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      suburban: (json['suburban'] as bool?) ?? false,
      subway: (json['subway'] as bool?) ?? false,
      tram: (json['tram'] as bool?) ?? false,
      bus: (json['bus'] as bool?) ?? false,
      ferry: (json['ferry'] as bool?) ?? false,
      express: (json['express'] as bool?) ?? false,
      regional: (json['regional'] as bool?) ?? false,
    );
  }

  /// Mapper to domain value object
  Products toEntity() => Products(
    suburban: suburban,
    subway: subway,
    tram: tram,
    bus: bus,
    ferry: ferry,
    express: express,
    regional: regional,
  );
}
