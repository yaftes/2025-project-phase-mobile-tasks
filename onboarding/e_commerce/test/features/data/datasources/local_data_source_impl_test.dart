import 'dart:convert';
import 'package:e_commerce/features/product/data/datasources/product_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_data_source_impl_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {

  
  const Set<String> keys = {'1', '2', '3'};

  Map<String, dynamic> values = {
    '1': {
      'id': '1',
      'name': 'unknown',
      'description': 'some thing cool',
      'imageUrl': 'https/.asd.com',
      'price': 223,
    },
    '2': {
      'id': '2',
      'name': 'unknown',
      'description': 'some thing cool',
      'imageUrl': 'https/.asd.com',
      'price': 223,
    },
    '3': {
      'id': '3',
      'name': 'unknown',
      'description': 'some thing cool',
      'imageUrl': 'https/.asd.com',
      'price': 223,
    },
  };

  late MockSharedPreferences preferences;
  late ProductLocalDataSourceImpl localDataSource;

  setUp(() {
    preferences = MockSharedPreferences();
    localDataSource = ProductLocalDataSourceImpl(prefs: preferences);
  });

  test(
    'returns cached product list when present in SharedPreferences',
    () async {
      when(preferences.getKeys()).thenReturn(keys);
      when(preferences.getString(any)).thenAnswer((invocation) {
        final key = invocation.positionalArguments.first as String;
        final productMap = values[key] as Map<String, dynamic>;
        return jsonEncode(productMap);
      });

      final result = await localDataSource.getRecentProducts();

      expect(result.length, 3);
      expect(result[0].id, '1');
    },
  );
}
