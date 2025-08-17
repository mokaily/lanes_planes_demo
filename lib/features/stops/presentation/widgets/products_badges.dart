import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/entities/products.dart';

class ProductsBadges extends StatelessWidget {
  final Products products;
  const ProductsBadges({super.key, required this.products});

  final String assetPath = 'assets/icons/';

  @override
  Widget build(BuildContext context) {
    final chips = <Widget>[
      if (products.subway) _chip(context, "${assetPath}subway.svg"),
      if (products.suburban) _chip(context, "${assetPath}suburban.svg"),
      if (products.tram) _chip(context, "${assetPath}tram.svg"),
      if (products.bus) _chip(context, "${assetPath}bus.svg"),
      if (products.ferry) _chip(context, "${assetPath}ferry.svg"),
      if (products.express) _chip(context, "${assetPath}express.svg"),
      if (products.regional) _chip(context, "${assetPath}regional.svg"),
    ];

    if (chips.isEmpty) return const SizedBox.shrink();

    return Wrap(spacing: 4, runSpacing: 4, children: chips);
  }

  Widget _chip(BuildContext context, String assetName) {
    return SvgPicture.asset(assetName);
  }
}
