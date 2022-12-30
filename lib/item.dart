import 'package:shopping_cart/product.dart';

class Item {
  const Item({
    required this.product,
    this.quantity = 1,
  });

  final Product product;
  final int quantity;

  double get price => product.price * quantity;

  String displayItem() => '$quantity x ${product.name}: \$${price.toStringAsFixed(2)}';

  @override
  String toString() => '$quantity x ${product.name} = \$${price.toStringAsFixed(2)}';

}