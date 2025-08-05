import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/platform/network_info.dart';
import 'core/platform/network_info_impl.dart';
import 'features/product/data/datasources/product_local_data_source.dart';
import 'features/product/data/datasources/product_remote_data_source.dart';
import 'features/product/data/repositories/product_repository_impl.dart';
import 'features/product/domain/repositories/product_repository.dart';
import 'features/product/domain/usecases/create_product.dart';
import 'features/product/domain/usecases/delete_product.dart';
import 'features/product/domain/usecases/get_all_products.dart';
import 'features/product/domain/usecases/get_product_by_id.dart';
import 'features/product/domain/usecases/update_product.dart';
import 'features/product/presentation/bloc/product_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // External packages
  final sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  getIt.registerLazySingleton<http.Client>(() => http.Client());
  getIt.registerLazySingleton<InternetConnection>(() => InternetConnection());

  // Core
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  // data sources
  getIt.registerLazySingleton<ProductLocalDataSource>(
    () => ProductLocalDataSourceImpl(prefs: getIt()),
  );

  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(client: getIt()),
  );

  // Repository
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      localDataSource: getIt<ProductLocalDataSource>(),
      remoteDataSource: getIt<ProductRemoteDataSource>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );

  // use cases
  getIt.registerLazySingleton(() => CreateProduct(getIt()));
  getIt.registerLazySingleton(() => GetAllProducts(getIt()));
  getIt.registerLazySingleton(() => GetProductById(getIt()));
  getIt.registerLazySingleton(() => UpdateProduct(getIt()));
  getIt.registerLazySingleton(() => DeleteProduct(getIt()));

  // Bloc
  getIt.registerFactory(
    () => ProductBloc(
      createProduct: getIt(),
      getAllProducts: getIt(),
      getProductById: getIt(),
      updateProduct: getIt(),
      deleteProduct: getIt(),
    ),
  );
}
