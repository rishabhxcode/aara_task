import 'package:flutter/material.dart';

final ThemeData defaultTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: ButtonThemeData(
        buttonColor: Colors.black, textTheme: ButtonTextTheme.primary),
    appBarTheme: AppBarTheme(
        color: Colors.white, iconTheme: IconThemeData(color: Colors.black)));
