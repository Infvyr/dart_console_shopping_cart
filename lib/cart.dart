import 'dart:io';

import 'package:shopping_cart/item.dart';
import 'package:shopping_cart/product.dart';

class Cart {
  final Map<int, Item> _items = {};

  String get totalPriceString => '\$${totalPrice().toStringAsFixed(2)}';
  Iterable<Item> get itemsValues => _items.values.toList();
  bool get isEmpty => _items.isEmpty;

  double totalPrice() => _items.values.fold(0, (total, item) => total + item.price);

  void addProduct(Product product) {
    final item = _items[product.id];
    if(item == null) {
      _items[product.id] = Item(product: product, quantity: 1);
    } else {
      _items[product.id] = Item(product: product, quantity: item.quantity + 1);
    }
  }

  void removeProduct(Product product) {
    final item = _items[product.id];
    if(item == null) {
      return;
    } else if(item.quantity == 1) {
      _items.remove(product.id);
    } else {
      _items[product.id] = Item(product: product, quantity: item.quantity - 1);
    }
  }

  String displayCart() {
    if(_items.isEmpty) {
      return '\n------------------------\nYour cart is empty!\n------------------------\n';
    }

    final productList = itemsValues.map((item) => item.displayItemInCart()).join('\n');

    return '\n--------------------------------\nYour cart: \n$productList\n--------------------------------\nTotal: $totalPriceString\n--------------------------------\n';
  }

  String clearCart() {
    if(_items.isEmpty) {
      return '\n------------------------\nYour cart is empty!\n------------------------\n';
    }
    
    final productList = itemsValues.map((item) => item.displayItemInCart()).join('\n');

    stdout.write('\n---------------------------------\nAvailable products in the cart:\n$productList\n---------------------------------\nAre you sure you want to clear your cart? (y/n)\n> ');
    final input = stdin.readLineSync();

    if(input == 'y') {
      _items.clear();
      return '\n-----------------------------------\nYour cart has been cleared!\n-----------------------------------\n';
    } else {
      return '\n------------------------------------------------\nYou has been kept your products in the cart!\n------------------------------------------------\n';
    }
  }
}