import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static const Map<String, Color> _aestheticColors = {
    'primary': Color(0xFFD2BA9E),
    'primaryContainer': Color(0xFFEEEADE),
    'onPrimary': Color(0xFF2D1F55),
    'secondary': Color(0xFFB9928B),
    'secondaryContainer': Color(0xFFD6A698),
    'onSecondary': Color(0xFFFEFEFE),
    'tertiary': Color(0xFF2D1F55),
    'onTertiary': Color(0xFFFEFEFE),
    'background': Color(0xFFFEFEFE),
    'onBackground': Color(0xFF2D1F55),
    'surface': Color(0xFFFAF7EF),
    'surfaceVariant': Color(0xFFFEFEFE),
    'onSurface': Color(0xFF2D1F55),
    'error': Colors.red,
    'onError': Colors.black,
  };

  static final TextStyle _aestheticTextStyle = GoogleFonts.lora(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.15,
    color: const Color(0xFF2D1F55),
  );

  static final ThemeData aestheticTheme = ThemeData(
    //Color scheme
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _aestheticColors['primary']!,
      primaryContainer: _aestheticColors['primaryContainer']!,
      onPrimary: _aestheticColors['onPrimary']!,
      secondary: _aestheticColors['secondary']!,
      secondaryContainer: _aestheticColors['secondaryContainer']!,
      onSecondary: _aestheticColors['onSecondary']!,
      tertiary: _aestheticColors['tertiary']!,
      onTertiary: _aestheticColors['onTertiary']!,
      background: _aestheticColors['background']!,
      onBackground: _aestheticColors['onBackground']!,
      surface: _aestheticColors['surface']!,
      surfaceVariant: _aestheticColors['surfaceVariant']!,
      onSurface: _aestheticColors['onSurface']!,
      error: _aestheticColors['error']!,
      onError: _aestheticColors['onError']!,
    ),

    //Text theme
    textTheme: TextTheme(
      headlineLarge: _aestheticTextStyle.copyWith(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: _aestheticColors['onBackground']!,
      ),
      headlineMedium: _aestheticTextStyle.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: _aestheticColors['onBackground']!,
      ),
      headlineSmall: _aestheticTextStyle.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: _aestheticColors['onBackground']!,
      ),
      bodyLarge: _aestheticTextStyle.copyWith(
        fontSize: 25,
        fontWeight: FontWeight.normal,
        color: _aestheticColors['onBackground']!,
      ),
      bodyMedium: _aestheticTextStyle.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: _aestheticColors['background']!,
      ),
      bodySmall: _aestheticTextStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: _aestheticColors['onBackground']!,
      ),
      //input decoration theme
      titleLarge: _aestheticTextStyle.copyWith(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: _aestheticColors['onBackground']!,
      ),
      titleMedium: _aestheticTextStyle.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: _aestheticColors['onBackground']!,
      ),
    ),

    //Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      constraints: const BoxConstraints(),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      isDense: true,
      hintStyle: _aestheticTextStyle.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: _aestheticColors['onBackground']!,
      ),
      filled: true,
      fillColor: _aestheticColors['primaryContainer']!,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      suffixStyle: _aestheticTextStyle.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: _aestheticColors['onBackground']!,
      ),
      labelStyle: _aestheticTextStyle.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: _aestheticColors['onBackground']!,
      ),
    ),

    //Slider theme
    sliderTheme: SliderThemeData(
      activeTrackColor: _aestheticColors['secondaryContainer']!,
      inactiveTrackColor: _aestheticColors['secondaryContainer']!,
      trackHeight: 3,
      thumbColor: _aestheticColors['secondaryContainer']!,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
      overlayColor: _aestheticColors['primary']!.withAlpha(32),
      overlayShape: SliderComponentShape.noOverlay,
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
    ),
  );
}
