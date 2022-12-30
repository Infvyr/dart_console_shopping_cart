import 'dart:io';

import 'cart.dart';
import 'helpers.dart';

void addItem(Cart cart) {
  final product = chooseProduct();
  final productName = product?.productName;

  if(product != null) {
    cart.addProduct(product);
    print('\n-------------------------------------------\n$productName has been added to your cart!\n-------------------------------------------\n');
  }
}

void viewCart(Cart cart) {
  print(cart.displayCart());
}

void dropItem(Cart cart) {
  if(cart.itemsValues.isEmpty) {
    print('\n------------------------\nYour cart is empty!\n------------------------\n');
    return;
  }

  final productList = cart.itemsValues.map((item) => item.displayItemRemove()).join('\n');

  stdout.write('\n---------------------------------\nAvailable products in the cart:\n$productList\n---------------------------------\nChoose a product ID to remove\n> ');
  final input = stdin.readLineSync();

  for(final item in cart.itemsValues) {
    if (item.product.id.toString() == input) {
      cart.removeProduct(item.product);

      if(item.quantity > 1) {
        print('\n------------------------------------------------------------\n${item.product.productName} has been removed from your cart! Left ${item.quantity - 1} ${item.product.productName}.\n------------------------------------------------------------\n');
      } else {
        print('\n------------------------------------------\n${item.product.productName} has been removed from your cart!\n------------------------------1------------\n');
      }
      return;
    }
  }

  print('\n----------------------------------------------------\nInvalid input! Choose a product ID from the menu.\n----------------------------------------------------\n');
}

void clearCart(Cart cart) {
  print(cart.clearCart());
}

void printCheckout(Cart cart) {
  if(checkout(cart)) {
    return;
  }
}