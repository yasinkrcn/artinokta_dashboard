import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData customTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      primaryColor: Colors.blue,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: Colors.orange,
        textTheme: ButtonTextTheme.primary,
      ),
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.white,
      textTheme: GoogleFonts.poppinsTextTheme(),
    );
  }
}
