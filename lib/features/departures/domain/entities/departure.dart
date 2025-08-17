import 'package:equatable/equatable.dart';

class Departure extends Equatable {
  final String id; // tripId
  final String lineName; // line.name (e.g. U1, 100)
  final String product; // line.product (bus, subway, tram, ...)
  final String direction; // destination text
  final DateTime plannedWhen; // scheduled time
  final DateTime? realtimeWhen; // realtime "when" (can be null)
  final int? delaySeconds; // delay in seconds (API returns seconds)
  final String? platform; // platform or plannedPlatform

  const Departure({
    required this.id,
    required this.lineName,
    required this.product,
    required this.direction,
    required this.plannedWhen,
    this.realtimeWhen,
    this.delaySeconds,
    this.platform,
  });

  @override
  List<Object?> get props => [
    id,
    lineName,
    product,
    direction,
    plannedWhen,
    realtimeWhen,
    delaySeconds,
    platform,
  ];
}
