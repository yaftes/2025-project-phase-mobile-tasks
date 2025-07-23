import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/services/data.dart';

class ProductService {
  static void addProduct({
    String? imagePath,
    required String name,
    required String category,
    required double price,
    required String description,
  }) {
    listOfProducts.add(
      Product(
        imagePath: imagePath,
        name: name,
        category: category,
        price: price,
        description: description,
      ),
    );
  }

  static void deleteProduct(String name) {
    try {
      listOfProducts.removeWhere((element) => element.name == name);
    } catch (e) {
      print('Item not Found');
    }
  }

  static void updateProduct({
    required String name,
    required String newName,
    required String category,
    required double price,
    required String description,
  }) {
    try {
      final product = listOfProducts.firstWhere(
        (element) => element.name == name,
      );
      product.name = newName;
      product.category = category;
      product.description = description;
      product.price = price;
    } catch (e) {
      print(e);
    }
  }
}
