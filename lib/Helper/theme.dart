import 'package:flutter/material.dart';


const Color purple = Color(0xFF4e5ae8);
const Color yellow = Color(0xFFFFB746);
const Color pink = Color(0xFFF1A39A);
const Color deepPink = Color(0xFFFA63C6);
const Color green = Color(0xFF41CF9F);
const Color lightBlue = Color(0xFF42A5F5);
const Color blue = Color(0xFF2B60E6);
const Color white = Colors.white;
const Color darkGrayClr = Color(0xFF121212);
Color darkHeaderClr = Color(0xFF000000);

// Icon
const personIcon = 0xe491;
const workIcon = 0xe11c;
const movieIcon = 0xe40f;
const sportIcon = 0xe4dc;
const travelIcon = 0xe071;
const shopIcon = 0xe59c;




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