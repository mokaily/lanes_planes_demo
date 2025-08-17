import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/get_departures_usecase.dart';
import '../../domain/entities/departure.dart';
import 'departure_state.dart';

class DepartureNotifier extends StateNotifier<DepartureState> {
  final GetDeparturesUseCase getDepartures;

  DepartureNotifier({required this.getDepartures}) : super(DepartureInitial());

  Future<void> loadDepartures(String stopId) async {
    state = DepartureLoading();
    try {
      final List<Departure> departures = await getDepartures(stopId);
      if (departures.isEmpty) {
        state = DepartureEmpty();
      } else {
        state = DepartureLoaded(departures);
      }
    } catch (e) {
      state = DepartureError(e.toString());
    }
  }
}
