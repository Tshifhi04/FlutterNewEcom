import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
    border: outlineInputBorder,
    errorBorder: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder,


  ),
  elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 6, 53, 107),
    disabledBackgroundColor: Colors.grey,
  ),

  ),
  appBarTheme: AppBarTheme(backgroundColor: Colors.white,elevation: 0.0,iconTheme: IconThemeData(color: Colors.black))
);

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey,)
    );