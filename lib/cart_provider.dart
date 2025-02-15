import 'package:candy_store/cart_notifier.dart';
import 'package:flutter/material.dart';

class CartProvider extends InheritedWidget {
  final CartNotifier cartNotifier;

  const CartProvider({
    super.key,
    required this.cartNotifier,
    required super.child,
  });

  static CartNotifier of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CartProvider>()!
        .cartNotifier;
  }

  @override
  bool updateShouldNotify(covariant CartProvider oldWidget) {
    return cartNotifier != oldWidget.cartNotifier;
  }
}
