import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lanes_planes_demo/core/app_colors.dart';

class DepartureAppBarWidget extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  final String title;
  const DepartureAppBarWidget({super.key, required this.title});

  @override
  ConsumerState<DepartureAppBarWidget> createState() =>
      _DepartureAppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(80.0);
}

class _DepartureAppBarWidgetState extends ConsumerState<DepartureAppBarWidget> {
  double _height = 80;
  double _opacity = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _height = 60;
        _opacity = 1.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: SafeArea(
        bottom: false,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          opacity: _opacity,
          child: AnimatedSize(
            duration: const Duration(milliseconds: 400),
            curve: Curves.linear,
            child: Container(
              height: _height,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border(bottom: BorderSide(color: AppColors.black)),
              ),
              child: SizedBox(
                height: 60,
                child: AppBar(
                  centerTitle: true,
                  title: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  leading: SizedBox.shrink(),
                  actions: [
                    InkWell(
                      child: SvgPicture.asset("assets/icons/close.svg"),
                      onTap: () {
                        Navigator.of(
                          context,
                        ).popUntil((route) => route.isFirst);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
