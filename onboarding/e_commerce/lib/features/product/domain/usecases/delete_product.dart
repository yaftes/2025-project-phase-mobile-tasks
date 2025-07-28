import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/product_repository.dart';

class DeleteProduct {
  final ProductRepository repository;
  DeleteProduct(this.repository);

  Future<Either<Failure, Unit>> call(String productId) async {
    return await repository.deleteProduct(productId);
  }
}
