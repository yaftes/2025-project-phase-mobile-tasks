import 'package:e_commerce/core/platform/network_info.dart';
import 'package:e_commerce/features/product/data/datasources/product_local_data_source.dart';
import 'package:e_commerce/features/product/data/datasources/product_remote_data_source.dart';
import 'package:e_commerce/features/product/data/repositories/product_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockProductRemoteDataSource extends Mock
    implements ProductRemoteDataSource {}

class MockProductLocalDataSource extends Mock
    implements ProductLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  MockProductLocalDataSource mockProductLocalDataSource;
  MockProductRemoteDataSource mockProductRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;
  ProductRepositoryImpl productRepositoryImpl;

  setUp(() {
    mockProductLocalDataSource = MockProductLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    mockProductRemoteDataSource = MockProductRemoteDataSource();

    productRepositoryImpl = ProductRepositoryImpl(
      localDataSource: mockProductLocalDataSource,
      remoteDataSource: mockProductRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });
}
