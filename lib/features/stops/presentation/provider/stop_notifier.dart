import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lanes_planes_demo/features/stops/presentation/provider/stop_state.dart';
import '../../domain/entities/stop.dart';
import '../../domain/usecases/search_stops_usecase.dart';

class StopNotifier extends StateNotifier<StopState> {
  final SearchStopsUseCase searchStops;

  StopNotifier({required this.searchStops}) : super(StopInitial());

  Future<void> search(String query) async {
    if (query.isEmpty) {
      state = StopEmpty();
      return;
    }

    state = StopLoading();
    try {
      final List<Stop> stops = await searchStops(query);
      if (stops.isEmpty) {
        state = StopEmpty();
      } else {
        state = StopLoaded(stops);
      }
    } catch (e) {
      state = StopError(e.toString());
    }
  }
}
