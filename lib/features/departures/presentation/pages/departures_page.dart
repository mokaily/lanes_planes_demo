import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lanes_planes_demo/features/departures/presentation/widgets/departure_app_bar_widget.dart';
import 'package:lanes_planes_demo/providers.dart';
import '../providers/departure_state.dart';
import '../widgets/departure_tile.dart';

class DeparturesPage extends ConsumerStatefulWidget {
  final String stopId;
  final String stopName;

  const DeparturesPage({
    super.key,
    required this.stopId,
    required this.stopName,
  });

  @override
  ConsumerState<DeparturesPage> createState() => _DeparturesPageState();
}

class _DeparturesPageState extends ConsumerState<DeparturesPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(departureNotifierProvider.notifier)
          .loadDepartures(widget.stopId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(departureNotifierProvider);

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: DepartureAppBarWidget(title: widget.stopName),
        body: _buildState(state),
      ),
    );
  }

  Widget _buildState(DepartureState state) {
    if (state is DepartureInitial || state is DepartureLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is DepartureEmpty) {
      return const Center(child: Text("No departures available"));
    } else if (state is DepartureError) {
      return Center(child: Text("Error: ${state.message}"));
    } else if (state is DepartureLoaded) {
      return ListView.builder(
        itemCount: state.departures.length,
        itemBuilder: (context, index) {
          final departure = state.departures[index];
          return DepartureTile(departure: departure);
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
