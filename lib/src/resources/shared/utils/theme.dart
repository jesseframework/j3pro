import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'MyFont',
);

final lightTheme = ThemeData(
  textTheme: TextTheme(
    bodyText1: TextStyle().copyWith(color: Colors.white,
    
    
    ),
 bodyText2:   TextStyle().copyWith(color: Colors.grey,
    
    
    ),
  ),
  primaryColor: Colors.blue,
  cardColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: Color(0xffe7ebee),
  scaffoldBackgroundColor: Color(0xffe7ebee),
  accentColor: Colors.black54,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
  textSelectionColor: Colors.grey,
  appBarTheme: AppBarTheme(
    color: Colors.blue,
  ),
  fontFamily: 'MyFont',
  textSelectionHandleColor: Colors.black45,
);
