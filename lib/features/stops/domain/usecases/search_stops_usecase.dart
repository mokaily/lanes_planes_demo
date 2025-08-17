import '../entities/stop.dart';
import '../repositories/stop_repository.dart';

class SearchStopsUseCase {
  final StopRepository repository;

  SearchStopsUseCase(this.repository);

  Future<List<Stop>> call(String query) {
    return repository.searchStops(query);
  }
}
