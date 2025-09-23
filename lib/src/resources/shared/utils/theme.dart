import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'MyFont',
);

final lightTheme = ThemeData(
  textTheme: TextTheme(
    bodyLarge: const TextStyle().copyWith(
      color: Colors.black,
    ),
    bodyMedium: const TextStyle().copyWith(
      color: Colors.black,
    ),
  ),
  primaryColor: Colors.blue,
  cardColor: Colors.white,
  brightness: Brightness.light,

  // backgroundColor: Color(0xffe7ebee),

  scaffoldBackgroundColor: const Color(0xffe7ebee),
  // accentColor: Colors.black54,
  colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.black54,
      surface: Color(0xffe7ebee)),

  // accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
  textSelectionTheme: const TextSelectionThemeData(
    selectionColor: Colors.grey,
    selectionHandleColor: Colors.black45,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blue,
  ),
  fontFamily: 'MyFont',
);
