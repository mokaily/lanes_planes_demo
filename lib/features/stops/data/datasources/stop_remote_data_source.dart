import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lanes_planes_demo/features/stops/data/models/stop_model.dart';

import '../../../../core/constants/app_strings.dart';

abstract class StopRemoteDataSource {
  Future<List<StopModel>> searchStops(String query, {int results = 10});
}

class StopRemoteDataSourceImpl implements StopRemoteDataSource {
  final String _baseUrl = AppStrings.baseUrl;
  final http.Client client;

  StopRemoteDataSourceImpl(this.client);

  @override
  Future<List<StopModel>> searchStops(String query, {int results = 10}) async {
    final uri = Uri.parse('$_baseUrl/locations').replace(
      queryParameters: {
        'query': query,
        'poi': 'false',
        'addresses': 'false',
        'results': '$results',
        'pretty': 'false',
        'language': 'en',
      },
    );

    final res = await client
        .get(uri, headers: {'Accept': 'application/json'})
        .timeout(const Duration(seconds: 10));

    if (res.statusCode == 200) {
      final body = json.decode(res.body) as List<dynamic>;
      return body
          .map((e) => StopModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw Exception('Stop search failed (${res.statusCode}): ${res.body}');
  }
}
