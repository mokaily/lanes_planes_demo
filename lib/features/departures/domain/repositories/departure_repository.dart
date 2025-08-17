import '../entities/departure.dart';

abstract class DepartureRepository {
  Future<List<Departure>> getDepartures(String stopId);
}
