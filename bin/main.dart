import 'dart:io';

import 'package:shopping_cart/cart.dart';
import 'package:shopping_cart/menu.dart' as menu;

void main() {
  print('\n--------------------------------\nWelcome to the shopping cart!\n--------------------------------\n');

  final cart = Cart();

  while(true) {
    print('What would you like to do?');
    stdout.write('1. Add an item\n2. View cart\n3. Drop an item\n4. Clear cart\n5. Checkout\nq. Quit\n> ');

    final input = stdin.readLineSync();

    switch(input) {
      case '1':
        menu.addItem(cart);
        break;
      case '2':
        menu.viewCart(cart);
        break;
      case '3':
        menu.dropItem(cart);
        break;
      case '4':
        menu.clearCart(cart);
        break;
      case '5':
        menu.printCheckout(cart);
        break;
      case 'q':
        exit(0);
      default:
        print('Invalid input! Choose an option from the menu.');
    }
  }
}