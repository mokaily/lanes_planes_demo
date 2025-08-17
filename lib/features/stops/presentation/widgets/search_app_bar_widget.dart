import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lanes_planes_demo/core/app_colors.dart';
import 'package:lanes_planes_demo/providers.dart';

class SearchAppBarWidget extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const SearchAppBarWidget({super.key});

  @override
  ConsumerState<SearchAppBarWidget> createState() => _SearchAppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(100.0);
}

class _SearchAppBarWidgetState extends ConsumerState<SearchAppBarWidget> {
  final TextEditingController _controller = TextEditingController();
  void _onSearchChanged(String query) {
    ref.read(stopNotifierProvider.notifier).search(query);
  }

  double _height = 100;
  double _opacity = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _height = 80;
        _opacity = 1.0;
      });
      _onSearchChanged("");
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
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: AppBar(
                        leadingWidth: 24,
                        leading: InkWell(
                          child: SvgPicture.asset(
                            "assets/icons/arrow_left_alt.svg",
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        actions: [
                          if (_controller.text.isNotEmpty)
                            InkWell(
                              child: SvgPicture.asset(
                                "assets/icons/cancel.svg",
                              ),
                              onTap: () {
                                _controller.clear();
                                _onSearchChanged('');
                              },
                            ),
                        ],
                        title: TextField(
                          controller: _controller,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(color: AppColors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            isDense: true,
                            hintText: "Search for station",
                            hintStyle: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(color: AppColors.grey600),
                          ),
                          onChanged: _onSearchChanged,
                        ),
                      ),
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
