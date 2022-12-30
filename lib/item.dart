import 'package:shopping_cart/product.dart';

class Item {
  const Item({
    required this.product,
    this.quantity = 1,
  });

  final Product product;
  final int quantity;

  double get price => product.price * quantity;

  String displayItemInCart() => '${product.name} x $quantity = \$${price.toStringAsFixed(2)}';

  String displayItemRemove() => 'ID: ${product.id} => ${product.name} x $quantity = \$${price.toStringAsFixed(2)}';
}