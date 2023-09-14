// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class Styles {
  static const COLOR = Colors.blue;
  static const SCAFFOLDCOLOR = Colors.grey;
  static final LIGHTTHEMEDATA = ThemeData(
    primarySwatch: Styles.COLOR,
    primaryColor: Colors.amber,
    fontFamily: 'Cairo',
    useMaterial3: true,
    scaffoldBackgroundColor: SCAFFOLDCOLOR.shade100,
    textTheme: Typography.material2021().black.copyWith(
          displayLarge: const TextStyle(
            fontSize: 72.0,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: const TextStyle(
            fontSize: 36.0,
            fontStyle: FontStyle.italic,
          ),
          bodyMedium: const TextStyle(
            fontSize: 14.0,
            fontFamily: 'Hind',
          ),
        ),
  );
}
