import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lanes_planes_demo/core/app_colors.dart';

import '../../../../core/shared/app_page_route.dart';
import '../../../stops/presentation/pages/search_page.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: SafeArea(
        bottom: false,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              AppPageRoute(
                builder: (BuildContext context) => const SearchPage(),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(bottom: BorderSide(color: AppColors.black)),
            ),
            child: IgnorePointer(
              child: SearchBar(
                hintText: "Search for station",
                leading: SvgPicture.asset("assets/icons/search.svg"),
                onChanged: null,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.0);
}
