import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'features/departures/data/datasources/departure_remote_data_source.dart';
import 'features/departures/data/repositories/departure_repository_impl.dart';
import 'features/departures/domain/repositories/departure_repository.dart';
import 'features/departures/domain/usecases/get_departures_usecase.dart';
import 'features/departures/presentation/providers/departure_notifier.dart';
import 'features/departures/presentation/providers/departure_state.dart';
import 'features/stops/data/datasources/stop_remote_data_source.dart';
import 'features/stops/data/repositories/stop_repository_impl.dart';
import 'features/stops/domain/repositories/stop_repository.dart';
import 'features/stops/domain/usecases/search_stops_usecase.dart';
import 'features/stops/presentation/provider/stop_notifier.dart';
import 'features/stops/presentation/provider/stop_state.dart';

/// Custom client with timeout
class TimeoutHttpClient extends http.BaseClient {
  final http.Client _inner;
  final Duration timeout;

  TimeoutHttpClient(this._inner, {this.timeout = const Duration(seconds: 3)});

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _inner.send(request).timeout(timeout);
  }
}

/// HTTP client provider with 3s timeout
final httpClientProvider = Provider<http.Client>((ref) {
  final client = TimeoutHttpClient(
    http.Client(),
    timeout: const Duration(seconds: 3),
  );
  ref.onDispose(client.close);
  return client;
});

/// Remote data sources
final stopRemoteDataSourceProvider = Provider<StopRemoteDataSource>((ref) {
  return StopRemoteDataSourceImpl(ref.read(httpClientProvider));
});

final departureRemoteDataSourceProvider = Provider<DepartureRemoteDataSource>((
  ref,
) {
  return DepartureRemoteDataSourceImpl(ref.read(httpClientProvider));
});

/// Repositories
final stopRepositoryProvider = Provider<StopRepository>((ref) {
  return StopRepositoryImpl(stopRemote: ref.read(stopRemoteDataSourceProvider));
});

final departureRepositoryProvider = Provider<DepartureRepository>((ref) {
  return DepartureRepositoryImpl(
    departureRemote: ref.read(departureRemoteDataSourceProvider),
  );
});

// UseCases
final searchStopsUseCaseProvider = Provider<SearchStopsUseCase>((ref) {
  return SearchStopsUseCase(ref.read(stopRepositoryProvider));
});

final getDeparturesUseCaseProvider = Provider<GetDeparturesUseCase>((ref) {
  return GetDeparturesUseCase(ref.read(departureRepositoryProvider));
});

// Notifiers
final stopNotifierProvider = StateNotifierProvider<StopNotifier, StopState>((
  ref,
) {
  return StopNotifier(searchStops: ref.watch(searchStopsUseCaseProvider));
});

final departureNotifierProvider =
    StateNotifierProvider<DepartureNotifier, DepartureState>((ref) {
      return DepartureNotifier(
        getDepartures: ref.watch(getDeparturesUseCaseProvider),
      );
    });
