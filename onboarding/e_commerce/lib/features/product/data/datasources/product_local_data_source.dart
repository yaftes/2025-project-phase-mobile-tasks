import '../../domain/entities/product.dart';

abstract class ProductLocalDataSource {
  Future<List<Product>> viewAllProducts();

  Future<Product> viewSpecificProduct(String productId);

  Future<void> createProduct(Product product);

  Future<Product> updateProduct(Product product);

  Future<void> deleteProduct(String productId);
}
