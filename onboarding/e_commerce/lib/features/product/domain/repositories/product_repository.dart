import 'package:dartz/dartz.dart';
// we use dartz for functional programming concepts like either
import '../../../../core/error/failures.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> viewAllProducts();

  Future<Either<Failure, Product>> viewSpecificProduct(String productId);

  Future<Either<Failure, Unit>> createProduct(Product product);

  Future<Either<Failure, Product>> updateProduct(Product product);

  Future<Either<Failure, Unit>> deleteProduct(String productId);
}
