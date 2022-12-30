import 'dart:io';

import 'package:shopping_cart/cart.dart';
import 'package:shopping_cart/helpers.dart';

void main() {
  print('\n--------------------------------\nWelcome to the shopping cart!\n--------------------------------\n');

  final cart = Cart();

  while(true) {
    print('What would you like to do?');
    stdout.write('1. Add an item\n2. View cart\n3. Drop an item\n4. Clear cart\n5. Checkout\n6.Exit\n> ');

    final input = stdin.readLineSync();

    switch(input) {
      case '1':
        final product = chooseProduct();
        if(product != null) {
          cart.addProduct(product);
        }
        print('\n------------------------\nAdded $product to cart\n--------------------------------\n');
        break;
      case '2':
        print(cart.displayCart());
        break;
      case '3':
        /// TODO: Drop an item from the cart
        print('Remove an item from the cart');
        break;
      case '4':
        print(cart.clearCart());
        break;
      case '5':
        print('Checkout');
        /// TODO: Checkout
        break;
      case '6':
        print('Exit');
        exit(0);
      default:
        print('Invalid input! Choose an option from the menu.');
    }
  }
}