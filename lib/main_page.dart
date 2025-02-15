import 'package:candy_store/cart_button.dart';
import 'package:candy_store/cart_list_item.dart';
import 'package:candy_store/cart_page.dart';
import 'package:candy_store/product_list_item.dart';
import 'package:candy_store/products_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<CartListItem> cartItems = [];
  final Map<String, CartListItem> cartItemsMap = {};

  @override
  Widget build(BuildContext context) {
    final totalCount = cartItemsMap.values.fold<int>(
      0,
      (prev, element) => prev + element.quantity,
    );
    return Stack(
      children: [
        ProductsPage(onAddToCart: addToCart),
        Positioned(
          right: 16,
          bottom: 16,
          child: GestureDetector(
            onTap: openCart,
            child: CartButton(count: totalCount),
          ),
        ),
      ],
    );
  }

  void addToCart(ProductListItem item) {
    CartListItem? existingItem = cartItemsMap[item.id];
    if (existingItem != null) {
      existingItem = CartListItem(
        product: existingItem.product,
        quantity: existingItem.quantity + 1,
      );
      cartItemsMap[item.id] = existingItem;
      setState(() {});
    } else {
      final cartItem = CartListItem(product: item, quantity: 1);
      cartItemsMap[item.id] = cartItem;
    }
  }

  void removeFromCart(CartListItem item) {
    CartListItem? existingItem = cartItemsMap[item.product.id];
    if (existingItem != null) {
      if (existingItem.quantity > 1) {
        existingItem = CartListItem(
          product: existingItem.product,
          quantity: existingItem.quantity - 1,
        );
        cartItemsMap[item.product.id] = existingItem;
        setState(() {});
      }
    } else {
      cartItemsMap.remove(item.product.id);
      setState(() {});
    }
  }

  void openCart() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => CartPage(
              items: cartItemsMap.values.toList(),
              onRemoveFromCart: removeFromCart,
              onAddToCart: (item) {
                addToCart(item.product);
              },
            ),
      ),
    );
  }
}
