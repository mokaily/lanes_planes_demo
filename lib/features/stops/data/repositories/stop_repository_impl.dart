import '../../domain/entities/stop.dart';
import '../../domain/repositories/stop_repository.dart';
import '../datasources/stop_remote_data_source.dart';
import '../models/stop_model.dart';

class StopRepositoryImpl implements StopRepository {
  final StopRemoteDataSource stopRemote;

  StopRepositoryImpl({required this.stopRemote});

  @override
  Future<List<Stop>> searchStops(String query) async {
    final List<StopModel> models = await stopRemote.searchStops(query);
    return models.map((m) => m.toEntity()).toList();
  }
}
