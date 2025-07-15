import 'dart:io';

import 'product_manager.dart';

void main() {
  final productManager = ProductManager();

  while (true) {
    print('To Add New Product Type 1');
    print('To View all Products Type 2');
    print('To View single Product Type 3');
    print('To Edit Product Type 4');
    print('To Delete Product Type 5');

    int value = int.parse(stdin.readLineSync() ?? '0');

    switch (value) {
      case 1:
        productManager.addProduct();
        break;
      case 2:
        productManager.displayProducts();
        break;
      case 3:
        productManager.findProduct();
        break;
      case 4:
        productManager.editProduct();
        break;
      case 5:
        productManager.deleteProduct();
        break;
      default:
        print('Invalid number');
    }
  }
}
