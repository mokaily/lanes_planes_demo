import 'package:flutter/material.dart';

class AppPageRoute<T> extends MaterialPageRoute<T> {
  AppPageRoute({required super.builder, super.settings});

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);
  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 200);
}
