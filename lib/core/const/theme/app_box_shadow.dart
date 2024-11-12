import 'package:flutter/material.dart';

class AppBoxShadow {
  static List<BoxShadow> get shadowOne => [
        const BoxShadow(
          blurRadius: 40,
          spreadRadius: -10,
          color: Colors.black,
          offset: Offset(0, 10),
        ),
      ];
}
