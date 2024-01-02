import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'MyFont',
);

final lightTheme = ThemeData(
  textTheme: TextTheme(
    bodyLarge: TextStyle().copyWith(
      color: Colors.black,
    ),
    bodyMedium: TextStyle().copyWith(
      color: Colors.black,
    ),
  ),
  primaryColor: Colors.blue,
  cardColor: Colors.white,
  brightness: Brightness.light,
   
  // backgroundColor: Color(0xffe7ebee),

  scaffoldBackgroundColor: Color(0xffe7ebee),
  // accentColor: Colors.black54,
  colorScheme: ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.black54,
    background:  Color(0xffe7ebee)
    
  ),
 
  // accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
  textSelectionTheme: TextSelectionThemeData(
    
    selectionColor:  Colors.grey,
    selectionHandleColor: Colors.black45,
    
  ),
  
  appBarTheme: AppBarTheme(
    color: Colors.blue,
  ),
  fontFamily: 'MyFont',
  
);
