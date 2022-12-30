class Product {
  const Product({
    required this.name,
    required this.price,
    required this.id
  });

  final String name;
  final double price;
  final int id;

  String get displayProduct => '($firstLetterOfProductName)${name.substring(1)}: \$$price';
  String get firstLetterOfProductName => name.substring(0, 1).toLowerCase();
  String get productName => name;
}