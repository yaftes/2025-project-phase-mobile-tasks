class Product {
  
  String? imagePath;
  String name;
  String category;
  double price;
  String description;

  Product({
    this.imagePath = 'jacket.jpg',
    required this.name,
    required this.category,
    required this.price,
    required this.description,
  });
}
