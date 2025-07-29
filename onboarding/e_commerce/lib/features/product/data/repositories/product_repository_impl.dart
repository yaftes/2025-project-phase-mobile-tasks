import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_data_source.dart';
import '../datasources/product_remote_data_source.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductLocalDataSource localDataSource;
  final ProductRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Unit>> createProduct(Product product) {
    // TODO: implement createProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteProduct(String productId) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Product>> updateProduct(Product product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Product>>> viewAllProducts() {
    // TODO: implement viewAllProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Product>> viewSpecificProduct(String productId) {
    // TODO: implement viewSpecificProduct
    throw UnimplementedError();
  }
}
