import 'package:equatable/equatable.dart';

class Products extends Equatable {
  final bool suburban; // S-Bahn
  final bool subway; // U-Bahn
  final bool tram;
  final bool bus;
  final bool ferry;
  final bool express; // e.g. IC/ICE
  final bool regional; // RB/RE

  const Products({
    required this.suburban,
    required this.subway,
    required this.tram,
    required this.bus,
    required this.ferry,
    required this.express,
    required this.regional,
  });

  static const empty = Products(
    suburban: false,
    subway: false,
    tram: false,
    bus: false,
    ferry: false,
    express: false,
    regional: false,
  );

  @override
  List<Object?> get props => [
    suburban,
    subway,
    tram,
    bus,
    ferry,
    express,
    regional,
  ];
}
