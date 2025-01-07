import 'package:alarm_app/screens/starting_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kcolorscheme = ColorScheme.fromSeed(seedColor: Colors.black);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        colorScheme: kcolorscheme,
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: GoogleFonts.outfit(
                textStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: kcolorscheme.onPrimary,
                ),
              ),
              titleMedium: GoogleFonts.outfit(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: kcolorscheme.onPrimary,
                ),
              ),
              titleSmall: GoogleFonts.outfit(
                textStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                  color: kcolorscheme.onPrimary,
                ),
              ),
              // bodyLarge: GoogleFonts.outfit(
              //   textStyle: TextStyle(
              //     fontSize: 32,
              //     fontWeight: FontWeight.normal,
              //     color: kcolorscheme.onPrimary,
              //   ),
              // ),
              // bodyMedium: GoogleFonts.outfit(
              //   textStyle: TextStyle(
              //     fontSize: 16,
              //     fontWeight: FontWeight.normal,
              //     color: kcolorscheme.onPrimary,
              //   ),
              // ),
            ),
      ),
      home: const StartingScreen(),
    ),
  );
}
