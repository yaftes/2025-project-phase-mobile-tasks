import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class CreateProduct {
  final ProductRepository repository;
  CreateProduct(this.repository);

  Future<Either<Failure, Unit>> call(Product product) {
    return repository.createProduct(product);
  }
}
