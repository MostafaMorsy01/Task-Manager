import 'package:flutter/material.dart';


const Color bluishClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const Color primaryClr = bluishClr;
const Color darkGrayClr = Color(0xFF121212);

Color darkHeaderClr = Color(0xFF424242);


class Themes {
  static final light = ThemeData(
    primarySwatch: Colors.indigo,
      brightness:Brightness.light,
      // colorScheme:  ColorScheme
      //     .fromSwatch(primarySwatch: Colors.blue)
      //     .copyWith(primary:  primaryClr),
  );

  static final dark =  ThemeData(
      primarySwatch: Colors.blueGrey,
      // colorScheme:  ColorScheme
      //     .fromSwatch(primarySwatch: Colors.blue)
      //     .copyWith(primary:  darkGrayClr),
      brightness:Brightness.dark
  );


}