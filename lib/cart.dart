import 'dart:io';

import 'package:shopping_cart/item.dart';
import 'package:shopping_cart/product.dart';

class Cart {
  final Map<int, Item> _items = {};

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

  double totalPrice() => _items.values.fold(0, (total, item) => total + item.price);

  String get totalPriceString => '\$${totalPrice().toStringAsFixed(2)}';

  String displayCart() {
    if(_items.isEmpty) {
      return '\n------------------------\nYour cart is empty!\n------------------------\n';
    }

    final itemizedList = _items.values.map((item) => item.displayItem()).join('\n');

    return '\n--------------------------------\nYour cart: \n$itemizedList\n--------------------------------\nTotal: $totalPriceString\n--------------------------------\n';
  }

  String clearCart() {
    if(_items.isEmpty) {
      return '\n------------------------\nYour cart is empty!\nAdd some items, please.\n------------------------\n';
    }
    final productList = _items.values.map((item) => item.toString()).join('\n');

    stdout.write('\n---------------------------------\nAvailable products in the cart:\n$productList\n---------------------------------\nAre you sure you want to clear your cart? (y/n)\n> ');
    final input = stdin.readLineSync();

    if(input == 'y') {
      _items.clear();
      return '\n-----------------------------------\nYour cart has been cleared!\nYou may add some other products\n-----------------------------------\n';
    } else {
      return '\n------------------------------------------------\nYou has been kept your products in the cart!\n------------------------------------------------\n';
    }
  }

  @override
  String toString() {
    if(_items.isEmpty) {
      return '\n------------------------\nYour cart is empty!\n------------------------\n';
    }

    final itemizedList = _items.values.map((item) => item.toString()).join('\n');

    return '\n--------------------------------\nYour cart contains: \n$itemizedList\n--------------------------------\nTotal: $totalPriceString\n--------------------------------\n';
  }

}