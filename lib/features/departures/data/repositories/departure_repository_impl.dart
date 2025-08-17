import '../../domain/entities/departure.dart';
import '../../domain/repositories/departure_repository.dart';
import '../datasources/departure_remote_data_source.dart';

class DepartureRepositoryImpl implements DepartureRepository {
  final DepartureRemoteDataSource departureRemote;

  DepartureRepositoryImpl({required this.departureRemote});

  @override
  Future<List<Departure>> getDepartures(String stopId) async {
    final models = await departureRemote.getDepartures(stopId, results: 30);
    return models.map((m) => m.toEntity()).toList();
  }
}
