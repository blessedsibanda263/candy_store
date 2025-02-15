import 'package:candy_store/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Candy Store',
    theme: ThemeData(
      primarySwatch: Colors.lime,
    ),
    home: const MainPage(),
  ));
}


