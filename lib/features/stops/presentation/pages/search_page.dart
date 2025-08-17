import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lanes_planes_demo/core/shared/app_page_route.dart';
import 'package:lanes_planes_demo/features/departures/presentation/pages/departures_page.dart';
import 'package:lanes_planes_demo/features/stops/presentation/provider/stop_state.dart';
import 'package:lanes_planes_demo/features/stops/presentation/widgets/search_app_bar_widget.dart';
import 'package:lanes_planes_demo/features/stops/presentation/widgets/search_tile.dart';
import 'package:lanes_planes_demo/providers.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(stopNotifierProvider);

    return Scaffold(appBar: SearchAppBarWidget(), body: _buildState(state));
  }

  Widget _buildState(StopState state) {
    if (state is StopInitial) {
      return const Center(child: Text("Enter a stop name to search"));
    } else if (state is StopLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is StopEmpty) {
      return const Center(child: Text("No stops found"));
    } else if (state is StopError) {
      return Center(child: Text("Error: ${state.message}"));
    } else if (state is StopLoaded) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: state.stops.length,
        itemBuilder: (context, index) {
          final stop = state.stops[index];
          return InkWell(
            onTap: () => Navigator.push(
              context,
              AppPageRoute(
                builder: (_) =>
                    DeparturesPage(stopId: stop.id, stopName: stop.name),
              ),
            ),
            child: SearchTile(stop: stop),
          );
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
