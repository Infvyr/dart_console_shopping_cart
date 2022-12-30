import 'dart:io';

import 'product.dart';
import 'allProducts.dart';
import 'cart.dart';

Product? chooseProduct() {
  final productList = allProducts.map((product) => product.displayProduct).join('\n');

  stdout.write('Available products:\n$productList\nChoose a product\n> ');
  final input = stdin.readLineSync();

  for(final product in allProducts) {
    if (product.firstLetterOfProductName == input) {
      return product;
    }
  }

  print('\n----------------------------------------------------\nInvalid input! Choose a product from the menu.\n----------------------------------------------------\n');

  return null;
}

bool checkout(Cart cart) {
  if(cart.isEmpty) {
    print('\n------------------------\nYour cart is empty!\n------------------------\n');
    return false;
  }

  final total = cart.totalPrice();
  print('Total: \$${total.toStringAsFixed(2)}');

  stdout.write('Payment in cash: ');
  final input = stdin.readLineSync();
  if(input == null || input.isEmpty) {
    print('\n--------------------------------\nInvalid cash! Try again.\n--------------------------------\n');
    return false;
  }

  final payment = double.tryParse(input);
  if(payment == null) {
    print('\n--------------------------------\nInvalid input! Enter a number.\n--------------------------------\n');
    return false;
  }
  if(payment >= total) {
    final change = payment - total;
    print('Change: \$${change.toStringAsFixed(2)}');
    print('\n-----------------------------------\nThank you for your purchase!\n-----------------------------------\nYour order has been placed.\n-----------------------------------\n');
    return true;
  } else {
    print('\n-------------------------\nInsufficient funds!\n-------------------------\n');
    return false;
  }
}