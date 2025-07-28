import 'dart:convert';
import 'package:e_commerce/features/product/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../fixtures/fixture_reader.dart';

void main() {
  final ProductModel productModel = ProductModel(
    '2324',
    'unknown',
    'some thing cool',
    'https/.asd.com',
    223,
  );

  group('', () {
    test('test1', () {
      String content = fixture('product_fixture.json');
      final Map<String, dynamic> jsonFile = jsonDecode(content);
      var result = ProductModel.fromJson(jsonFile);

      expect(productModel, result);
    });
  });
}
