import 'package:e_commerce/features/product/data/datasources/product_local_data_source.dart';
import 'package:e_commerce/features/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'local_data_source_impl_test.mocks.dart';

@GenerateMocks([ProductLocalDataSource])
void main() {
  late MockProductLocalDataSource localDataSource;

  setUp(() {
    localDataSource = MockProductLocalDataSource();
  });

  test('test the local data source', () async {
    when(
      localDataSource.getRecentProducts(),
    ).thenAnswer((realInvocation) => Future.value(<Product>[]));

    final result = await localDataSource.getRecentProducts();
    expect(result, isA<List<Product>>());
  });
}
