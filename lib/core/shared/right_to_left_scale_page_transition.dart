import 'package:flutter/material.dart';

class RightToLeftScaleTransition extends PageTransitionsBuilder {
  const RightToLeftScaleTransition();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final slide = Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          ),
        );

    final scale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn,
      ),
    );

    return SlideTransition(
      position: slide,
      child: ScaleTransition(scale: scale, child: child),
    );
  }
}
