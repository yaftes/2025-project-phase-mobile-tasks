import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class ViewSpecificProduct {
  final ProductRepository repository;
  ViewSpecificProduct(this.repository);

  Future<Either<Failure, Product>> call(String productId) async {
    return repository.viewSpecificProduct(productId);
  }
}
