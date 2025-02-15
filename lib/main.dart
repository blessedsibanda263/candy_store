import 'package:candy_store/cart_notifier.dart';
import 'package:candy_store/cart_provider.dart';
import 'package:candy_store/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    CartProvider(
      cartNotifier: CartNotifier(),
      child: MaterialApp(
        title: 'Candy Store',
        theme: ThemeData(primarySwatch: Colors.lime),
        home: const MainPage(),
      ),
    ),
  );
}
