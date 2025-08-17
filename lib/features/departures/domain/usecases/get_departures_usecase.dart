import '../entities/departure.dart';
import '../repositories/departure_repository.dart';

class GetDeparturesUseCase {
  final DepartureRepository repository;

  GetDeparturesUseCase(this.repository);

  Future<List<Departure>> call(String stopId) {
    return repository.getDepartures(stopId);
  }
}
