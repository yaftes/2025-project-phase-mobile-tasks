import '../../domain/entities/product.dart';

abstract class ProductLocalDataSource {
  Future<List<Product>> getRecentProducts();
}
