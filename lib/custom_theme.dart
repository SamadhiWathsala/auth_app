import 'package:flutter/material.dart';

ThemeData customTheme() => ThemeData(
  primarySwatch: Colors.blue,
  textTheme:
  const TextTheme(headline3: TextStyle(fontSize: 24, color: Colors.black87)),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.grey[300],
    filled: true,
    hintStyle: const TextStyle(fontWeight: FontWeight.bold),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
          left: Radius.circular(50), right: Radius.circular(50)),
      borderSide: BorderSide(color: Colors.white),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
          left: Radius.circular(50), right: Radius.circular(50)),
      borderSide: BorderSide(color: Colors.black87),
    ),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
          left: Radius.circular(50), right: Radius.circular(50)),
      borderSide: BorderSide(color: Colors.white),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50),right: Radius.circular(50)),
      borderSide: BorderSide(color: Colors.red),
    ),

  ),
);
