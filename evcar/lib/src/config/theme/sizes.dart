import 'dart:math';

import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get topPadding => MediaQuery.of(this).padding.top;
  double get bottomPadding => MediaQuery.of(this).padding.bottom;
  double get leftPadding => MediaQuery.of(this).padding.left;
  double get rightPadding => MediaQuery.of(this).padding.right;

  EdgeInsets get systemPadding => MediaQuery.of(this).padding;
  Size get screenSize => MediaQuery.of(this).size;
  double get minScreenSize => min(
        MediaQuery.of(this).size.height,
        MediaQuery.of(this).size.width,
      );
  double get maxScreenSize => max(
        MediaQuery.of(this).size.height,
        MediaQuery.of(this).size.width,
      );
}
