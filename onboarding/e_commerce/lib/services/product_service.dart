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

  static void delete(String name) {
    try {
      final product = listOfProducts.firstWhere(
        (element) => element.name == name,
      );
      listOfProducts.remove(product);
    } catch (e) {
      print('Not item found to be deleted');
    }
  }

  
}
