import '../../domain/entities/departure.dart';

class DepartureModel {
  final String id; // tripId or id
  final String lineName; // line.name
  final String product; // line.product
  final String direction;
  final DateTime plannedWhen; // plannedWhen (fallback to when)
  final DateTime? realtimeWhen; // when
  final int? delaySeconds; // delay (seconds)
  final String? platform; // platform or plannedPlatform

  const DepartureModel({
    required this.id,
    required this.lineName,
    required this.product,
    required this.direction,
    required this.plannedWhen,
    this.realtimeWhen,
    this.delaySeconds,
    this.platform,
  });

  factory DepartureModel.fromJson(Map<String, dynamic> json) {
    final line = (json['line'] as Map<String, dynamic>?) ?? const {};
    final planned = (json['plannedWhen'] ?? json['when']) as String;

    return DepartureModel(
      id: (json['tripId'] ?? json['id'] ?? '') as String,
      lineName: (line['name'] ?? '') as String,
      product: (line['product'] ?? '') as String,
      direction: (json['direction'] ?? '') as String,
      plannedWhen: DateTime.parse(planned),
      realtimeWhen: json['when'] != null
          ? DateTime.parse(json['when'] as String)
          : null,
      delaySeconds: json['delay'] is int ? json['delay'] as int : null,
      platform: (json['platform'] ?? json['plannedPlatform']) as String?,
    );
  }

  Departure toEntity() => Departure(
    id: id,
    lineName: lineName,
    product: product,
    direction: direction,
    plannedWhen: plannedWhen,
    realtimeWhen: realtimeWhen,
    delaySeconds: delaySeconds,
    platform: platform,
  );
}
