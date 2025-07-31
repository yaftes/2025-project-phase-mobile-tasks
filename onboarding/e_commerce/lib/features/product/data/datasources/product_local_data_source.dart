import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/product.dart';
import '../models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<Product>> getRecentProducts();

  Future<void> cacheProducts(List<Product> products);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  SharedPreferences prefs;
  ProductLocalDataSourceImpl({required this.prefs});

  @override
  Future<List<Product>> getRecentProducts() async {
    final keys = prefs.getKeys();
    if (keys.isNotEmpty) {
      List<Product> products = [];
      for (var key in keys) {
        final jsonString = prefs.getString(key);
        if (jsonString != null) {
          final jsonMap = jsonDecode(jsonString);
          products.add(ProductModel.fromJson(jsonMap));
        }
      }
      return products;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheProducts(List<Product> products) async {
    for (var product in products) {
      ProductModel productModel = product as ProductModel;
      String value = jsonEncode(productModel.toJson());
      await prefs.setString(product.id, value);
    }
  }
}
