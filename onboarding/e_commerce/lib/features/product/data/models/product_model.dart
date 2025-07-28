import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel(
    String id,
    String name,
    String description,
    String imageUrl,
    double price,
  ) : super(
        id: id,
        name: name,
        description: description,
        imageUrl: imageUrl,
        price: price,
      );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      json['id'] as String,
      json['name'] as String,
      json['description'] as String,
      json['imageUrl'] as String,
      (json['price'] as int).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
    };
  }
}
