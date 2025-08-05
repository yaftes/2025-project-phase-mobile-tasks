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
        return Left(ServerFailure('unknown error from server'));
      }
    }
    return Left(ServerFailure('please connect to internet'));
  }

  @override
  Future<Either<Failure, Unit>> deleteProduct(String productId) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteProduct(productId);
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure('Server Failure'));
      }
    }
    return Left(ServerFailure('please connect to internet'));
  }

  @override
  Future<Either<Failure, Product>> updateProduct(Product product) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.updateProduct(product);
        return Right(product);
      } on ServerException {
        return Left(ServerFailure('Server Failure'));
      }
    }
    return Left(ServerFailure('please connect to internet'));
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        List<Product> products = await remoteDataSource.getAllProducts();
        return Right(products);
      } on ServerException {
        return Left(ServerFailure('Server Failure'));
      }
    } else {
      try {
        final products = await localDataSource.getRecentProducts();
        return Right(products);
      } on CacheException {
        return Left(CacheFailure('Cache Failure'));
      }
    }
  }

  @override
  Future<Either<Failure, Product>> getProductById(String productId) async {
    if (await networkInfo.isConnected) {
      try {
        Product product = await remoteDataSource.getProductById(productId);
        return Right(product);
      } on ServerException {
        return Left(ServerFailure('Server Failure'));
      }
    }

    return Left(ServerFailure('please connect to internet'));
  }
}
