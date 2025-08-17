import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lanes_planes_demo/core/app_colors.dart';
import 'package:lanes_planes_demo/features/stops/domain/entities/stop.dart';
import 'package:lanes_planes_demo/features/stops/presentation/widgets/products_badges.dart';

class SearchTile extends StatelessWidget {
  final Stop stop;
  const SearchTile({super.key, required this.stop});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 56),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(bottom: BorderSide(color: AppColors.grey300)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 28,
            alignment: Alignment.center,
            child: SvgPicture.asset("assets/icons/explore_nearby.svg"),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stop.name,
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 2,
                ),
                SizedBox(height: 4),
                ProductsBadges(products: stop.products),
              ],
            ),
          ),
          SizedBox(width: 12),
          Container(
            height: 28,
            alignment: Alignment.center,
            child: SvgPicture.asset("assets/icons/chevron_right.svg"),
          ),
        ],
      ),
    );
  }
}
