import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
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
  Future<Either<Failure, Unit>> createProduct(Product product) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.createProduct(product);
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    }

    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, Unit>> deleteProduct(String productId) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteProduct(productId);
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, Product>> updateProduct(Product product) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.updateProduct(product);
        return Right(product);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, List<Product>>> viewAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        List<Product> products = await remoteDataSource.viewAllProducts();
        return Right(products);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final products = await localDataSource.getRecentProducts();
        return Right(products);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Product>> viewSpecificProduct(String productId) async {
    if (await networkInfo.isConnected) {
      try {
        Product product = await remoteDataSource.viewSpecificProduct(productId);
        return Right(product);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }
}
