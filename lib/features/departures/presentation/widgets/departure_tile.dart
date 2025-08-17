import 'package:flutter/material.dart';
import 'package:lanes_planes_demo/features/departures/domain/entities/departure.dart';
import 'package:intl/intl.dart';
import 'package:lanes_planes_demo/features/departures/presentation/widgets/line_badge.dart';

import '../../../../core/app_colors.dart';

class DepartureTile extends StatelessWidget {
  final Departure departure;

  const DepartureTile({super.key, required this.departure});

  @override
  Widget build(BuildContext context) {
    final isDelayed =
        departure.delaySeconds != null && departure.delaySeconds! > 0;
    final time = DateFormat.Hm().format(
      departure.realtimeWhen ?? departure.plannedWhen,
    );

    return Container(
      constraints: const BoxConstraints(minHeight: 56),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(bottom: BorderSide(color: AppColors.grey300)),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LineBadge(departure: departure),
                  const SizedBox(height: 8),
                  Text(
                    departure.direction,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: departure.direction.toUpperCase(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        if (departure.platform != null) ...[
                          TextSpan(
                            text: " • ",
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: AppColors.grey600),
                          ),
                          TextSpan(
                            text: "Platform ${departure.platform}",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 64,
              decoration: BoxDecoration(
                color: isDelayed
                    ? AppColors.backgroundSystemError
                    : AppColors.backgroundSystemSuccess,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    time,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: isDelayed
                          ? AppColors.foregroundSystemError
                          : AppColors.foregroundSystemSuccess,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    isDelayed ? "delayed" : "on-time",
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: isDelayed
                          ? AppColors.foregroundSystemError
                          : AppColors.foregroundSystemSuccess,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
