import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/platform/network_info.dart';
import 'package:e_commerce/features/product/data/datasources/product_local_data_source.dart';
import 'package:e_commerce/features/product/data/datasources/product_remote_data_source.dart';
import 'package:e_commerce/features/product/data/repositories/product_repository_impl.dart';
import 'package:e_commerce/features/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'product_repository_impl_test.mocks.dart';

@GenerateMocks([NetworkInfo, ProductRemoteDataSource, ProductLocalDataSource])
void main() {
  late MockProductLocalDataSource localDataSource;
  late MockProductRemoteDataSource remoteDataSource;
  late MockNetworkInfo networkInfo;
  late ProductRepositoryImpl repository;

  setUp(() {
    localDataSource = MockProductLocalDataSource();
    remoteDataSource = MockProductRemoteDataSource();
    networkInfo = MockNetworkInfo();
    repository = ProductRepositoryImpl(
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
      networkInfo: networkInfo,
    );
  });

  test(
    'no specific data should be fetched for view specific product method when the network is offline',
    () async {
      when(networkInfo.isConnected).thenAnswer((_) async => false);
      final product = await repository.getProductById('232');

      verifyZeroInteractions(repository.remoteDataSource);
      expect(product, Left(ServerFailure('server error')));
    },
  );

  test('when user is offline cached products should be displayed', () async {
    when(networkInfo.isConnected).thenAnswer((_) async => false);
    when(localDataSource.getRecentProducts()).thenAnswer(
      (_) async => [
        Product(
          id: 'sdklsl',
          name: 'slkdj',
          description: 'skdgjl',
          imageUrl: 'sldjglk',
          price: 232,
        ),
        Product(
          id: 'sdk',
          name: 'slkdj',
          description: 'skdgjl',
          imageUrl: 'sldjglk',
          price: 232,
        ),
      ],
    );
    final products = await repository.getAllProducts();
    expect(products.isRight(), true);
  });
}
