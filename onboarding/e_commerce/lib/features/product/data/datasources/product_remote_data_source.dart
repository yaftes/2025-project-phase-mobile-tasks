import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/error/exceptions.dart';
import '../../data/models/product_model.dart';
import '../../domain/entities/product.dart';

final url = Uri.https(
  'g5-flutter-learning-path-be.onrender.com',
  '/api/v1/products',
);

abstract class ProductRemoteDataSource {
  Future<List<Product>> viewAllProducts();

  Future<Product> viewSpecificProduct(String productId);

  Future<void> createProduct(Product product);

  Future<Product> updateProduct(Product product);

  Future<void> deleteProduct(String productId);
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<void> createProduct(Product product) async {
    final uri = Uri.https(
      'g5-flutter-learning-path-be.onrender.com',
      '/api/v1/products',
    );

    try {
      final request = http.MultipartRequest('POST', uri);

      request.fields['name'] = product.name;
      request.fields['description'] = product.description;
      request.fields['price'] = product.price.toString();

      request.files.add(
        await http.MultipartFile.fromPath('image', product.imageUrl),
      );

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode != 201 && response.statusCode != 200) {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> deleteProduct(String productId) async {
    final url = Uri.https(
      'g5-flutter-learning-path-be.onrender.com',
      '/api/v1/products/$productId',
    );
    try {
      final response = await client.delete(url);
      if (response.statusCode != 200 && response.statusCode != 204) {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Product> updateProduct(Product product) async {
    final url = Uri.https(
      'g5-flutter-learning-path-be.onrender.com',
      '/api/v1/products/${product.id}',
    );

    try {
      final response = await client.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': product.name,
          'description': product.description,
          'price': product.price,
        }),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return ProductModel.fromJson(jsonData['data']);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<Product>> viewAllProducts() async {
    final url = Uri.https(
      'g5-flutter-learning-path-be.onrender.com',
      '/api/v1/products',
    );
    try {
      final response = await client.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        final List<dynamic> products = jsonData['data'];

        return products.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Product> viewSpecificProduct(String productId) async {
    final url = Uri.https(
      'g5-flutter-learning-path-be.onrender.com',
      '/api/v1/products/$productId',
    );
    try {
      final response = await client.get(url);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        final product = jsonData['data'];
        return ProductModel.fromJson(product);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
