import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lanes_planes_demo/core/constants/app_strings.dart';
import '../models/departure_model.dart';

abstract class DepartureRemoteDataSource {
  Future<List<DepartureModel>> getDepartures(
    String stopId, {
    int results = 30,
    int? durationMinutes,
  });
}

class DepartureRemoteDataSourceImpl implements DepartureRemoteDataSource {
  final String _baseUrl = AppStrings.baseUrl;
  final http.Client client;

  DepartureRemoteDataSourceImpl(this.client);

  @override
  Future<List<DepartureModel>> getDepartures(
    String stopId, {
    int results = 30,
    int? durationMinutes,
  }) async {
    final qp = <String, String>{
      'results': '$results',
      'pretty': 'false',
      'language': 'en',
      if (durationMinutes != null) 'duration': '$durationMinutes',
    };

    final uri = Uri.parse(
      '$_baseUrl/stops/$stopId/departures',
    ).replace(queryParameters: qp);

    final res = await client
        .get(uri, headers: {'Accept': 'application/json'})
        .timeout(const Duration(seconds: 12));

    if (res.statusCode != 200) {
      throw Exception(
        'Fetch departures failed (${res.statusCode}): ${res.body}',
      );
    }

    final decoded = json.decode(res.body);

    late final List<dynamic> items;
    if (decoded is List<dynamic>) {
      items = decoded;
    } else if (decoded is Map<String, dynamic> &&
        decoded['departures'] is List<dynamic>) {
      items = decoded['departures'] as List<dynamic>;
    } else {
      throw Exception('Unexpected departures payload: ${res.body}');
    }

    return items
        .whereType<Map<String, dynamic>>()
        .map(DepartureModel.fromJson)
        .toList();
  }
}
