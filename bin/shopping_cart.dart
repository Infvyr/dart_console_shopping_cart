import 'dart:io';

import 'package:shopping_cart/helpers.dart';

void main() {
  while(true) {
    print('What would you like to do?');
    stdout.write('1. Add an item\n2. View cart\n3. Checkout\n4.Exit\n> ');

    final input = stdin.readLineSync();

    switch(input) {
      case '1':
        final product = chooseProduct();
        if(product != null) {
          print(product.displayName);
        }
        break;
      case '2':
        print('View cart');
        /// TODO: View the cart
        break;
      case '3':
        print('Checkout');
        /// TODO: Checkout
        break;
      case '4':
        print('Exit');
        exit(0);
      default:
        print('Invalid input! Choose an option from the menu.');
    }
  }
}