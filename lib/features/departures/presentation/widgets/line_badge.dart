import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lanes_planes_demo/features/departures/domain/entities/departure.dart';

class LineBadge extends StatelessWidget {
  final Departure departure;
  const LineBadge({super.key, required this.departure});

  final String assetPath = 'assets/icons/';

  @override
  Widget build(BuildContext context) {
    final chips = <Widget>[
      if (departure.product == "subway")
        _chip(context, "${assetPath}subway.svg"),
      if (departure.product == "suburban")
        _chip(context, "${assetPath}suburban.svg"),
      if (departure.product == "tram") _chip(context, "${assetPath}tram.svg"),
      if (departure.product == "bus") _chip(context, "${assetPath}bus.svg"),
      if (departure.product == "ferry") _chip(context, "${assetPath}ferry.svg"),
      if (departure.product == "express")
        _chip(context, "${assetPath}express.svg"),
      if (departure.product == "regional")
        _chip(context, "${assetPath}regional.svg"),
    ];

    if (chips.isEmpty) return const SizedBox.shrink();

    return Wrap(spacing: 4, runSpacing: 4, children: chips);
  }

  Widget _chip(BuildContext context, String assetName) {
    return Row(
      children: [
        SvgPicture.asset(assetName),
        const SizedBox(width: 2),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
          child: Text(
            departure.lineName,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ],
    );
  }
}
