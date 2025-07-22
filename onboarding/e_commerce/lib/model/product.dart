class Product {
  final String? imagePath;
  final String name;
  final String category;
  final double price;
  final String description;

  Product({
    this.imagePath = 'jacket.jpg',
    required this.name,
    required this.category,
    required this.price,
    required this.description,
  });
}
