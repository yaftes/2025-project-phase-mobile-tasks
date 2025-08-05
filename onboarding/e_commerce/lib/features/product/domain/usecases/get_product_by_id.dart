import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProductById {
  final ProductRepository repository;
  GetProductById(this.repository);

  Future<Either<Failure, Product>> call(String productId) {
    return repository.getProductById(productId);
  }
}
