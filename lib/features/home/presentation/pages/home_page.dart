import 'package:flutter/material.dart';
import 'package:lanes_planes_demo/core/app_colors.dart';
import 'package:lanes_planes_demo/features/home/presentation/widgets/home_app_bar_widget.dart';

import '../../../../core/constants/app_strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBarWidget(),
      backgroundColor: AppColors.grey100,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/icons/eyes.png", width: 48, height: 48),
              SizedBox(height: 16),
              Text(
                AppStrings.findConnections,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 16),
              Text(
                AppStrings.loremIpsum,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 16),
              Text(
                AppStrings.cupping,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 16),
              Text(
                AppStrings.intelligentsia1,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 16),
              Text(
                AppStrings.intelligentsia2,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 16),
              Text(
                AppStrings.chicharrones,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
