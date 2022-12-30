import 'dart:io';

import 'package:shopping_cart/product.dart';
import 'allProducts.dart';

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