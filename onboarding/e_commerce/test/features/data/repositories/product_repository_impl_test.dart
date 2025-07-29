import 'package:e_commerce/core/platform/network_info.dart';
import 'package:e_commerce/features/product/data/datasources/product_local_data_source.dart';
import 'package:e_commerce/features/product/data/datasources/product_remote_data_source.dart';
import 'package:e_commerce/features/product/data/repositories/product_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([NetworkInfo, ProductRemoteDataSource, ProductLocalDataSource])
void main() {}
