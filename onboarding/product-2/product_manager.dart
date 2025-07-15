import 'dart:io';
import 'product.dart';

class ProductManager {
  final List<Product> listOfProduct = [];

  void addProduct() {
    print('Enter the Product Name: ');
    String? name = stdin.readLineSync();
    print('Enter the Product description: ');
    String? description = stdin.readLineSync();
    print('Enter the Product price: ');
    String? price = stdin.readLineSync();

    Product product = Product(
      name: name ?? '',
      description: description ?? '',
      price: double.parse(price ?? '0.0'),
    );

    listOfProduct.add(product);
    print('succesfully added');
  }

  void displayProducts() {
    if (listOfProduct.isEmpty) {
      print('No Product');
    } else {
      print('List of Products');
      for (int i = 0; i < listOfProduct.length; i++) {
        print('Product Name: ${listOfProduct[i].name}');
        print('Product Description: ${listOfProduct[i].description}');
        print('Product Price: ${listOfProduct[i].price}');
        print('------------------------------');
      }
    }
  }

  void findProduct() {
    print('Please enter the product name: ');

    try {
      String? name = stdin.readLineSync();
      Product product = listOfProduct.firstWhere((element) {
        return element.name == name;
      });

      print('---------------------------');
      print(product.name);
      print(product.description);
      print(product.price);
      print('--------------------------');
    } catch (e) {
      print('Product Not Found');
    }
  }

  void editProduct() {
    print('Please enter the product name: ');

    try {
      String? user_search_name = stdin.readLineSync();

      Product product = listOfProduct.firstWhere((element) {
        return element.name == user_search_name;
      });

      print('Enter the Product Name: ');
      String? name = stdin.readLineSync();
      print('Enter the Product description: ');
      String? description = stdin.readLineSync();
      print('Enter the Product price: ');
      String? price = stdin.readLineSync();

      product.name = name ?? '';
      product.description = description ?? '';
      product.price = double.parse(price ?? '0.0');

      print('successfully updated');
    } catch (e) {
      print('Product not Found');
    }
  }

  void deleteProduct() {
    print('Please enter the product name: ');
    String? name = stdin.readLineSync();
    listOfProduct.removeWhere((element) {
      return element.name == name;
    });
    print('Product Deleted');
  }
}
