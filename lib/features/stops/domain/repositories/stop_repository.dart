import '../entities/stop.dart';

abstract class StopRepository {
  Future<List<Stop>> searchStops(String query);
}
