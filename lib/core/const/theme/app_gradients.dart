import 'package:flutter/material.dart';

class AppGradients {
  static Gradient get gradientBlue => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFF009FC2),
          Color(0xFFF0D0A0B),
        ],
      );

  static Gradient get gradientBlueReversed => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFF0D0A0B),
          Color(0xFFF009FC2),
        ],
      );

  static Gradient get gradientFlame => const LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          Colors.red,
          Colors.orange,
          Colors.yellow,
        ],
      );

  static Gradient get gradientFlame2 => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFf40752),
          Color(0xFFFf9ab8f),
        ],
      );
}
