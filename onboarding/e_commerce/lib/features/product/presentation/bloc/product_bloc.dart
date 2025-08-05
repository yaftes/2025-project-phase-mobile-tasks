import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/create_product.dart';
import '../../domain/usecases/delete_product.dart';
import '../../domain/usecases/get_all_products.dart';
import '../../domain/usecases/get_product_by_id.dart';
import '../../domain/usecases/update_product.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  // here we have the usecases as a parameter since they are the boundary between the domain and presentation layer

  final CreateProduct createProduct;
  final GetAllProducts getAllProducts;
  final GetProductById getProductById;
  final UpdateProduct updateProduct;
  final DeleteProduct deleteProduct;

  // network info instance

  ProductBloc({
    required this.createProduct,
    required this.getAllProducts,
    required this.getProductById,
    required this.updateProduct,
    required this.deleteProduct,
  }) : super(InitialState()) {
    on<LoadAllProductEvent>(_onLoadAllProducts);
    on<GetSingleProductEvent>(_onGetSingleProduct);
    on<CreateProductEvent>(_onCreateProduct);
    on<UpdateProductEvent>(_onUpdateProduct);
    on<DeleteProductEvent>(_onDeleteProduct);
  }

  // the onload method should give us either locally cached data or fetch from remote repository

  Future<void> _onLoadAllProducts(
    LoadAllProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(LoadingState());
    final result = await getAllProducts();
    result.fold(
      (failure) => emit(ErrorState(message: failure.message)),
      (products) => emit(LoadedAllProductState(products: products)),
    );
  }

  Future<void> _onGetSingleProduct(
    GetSingleProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(LoadingState());
    final result = await getProductById(event.productId);

    result.fold(
      (failure) => emit(ErrorState(message: failure.message)),
      (product) => emit(LoadedSingleProductState(product: product)),
    );
  }

  Future<void> _onCreateProduct(
    CreateProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(LoadingState());
    final result = await createProduct(event.product);

    result.fold((failure) => emit(ErrorState(message: failure.message)), (
      _,
    ) async {
      final productsResult = await getAllProducts();
      productsResult.fold(
        (failure) => emit(ErrorState(message: failure.message)),
        (products) => emit(LoadedAllProductState(products: products)),
      );
    });
  }

  Future<void> _onUpdateProduct(
    UpdateProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(LoadingState());
    final result = await updateProduct(event.product);

    result.fold((failure) => emit(ErrorState(message: failure.message)), (
      _,
    ) async {
      final productsResult = await getAllProducts();
      productsResult.fold(
        (failure) => emit(ErrorState(message: failure.message)),
        (products) => emit(LoadedAllProductState(products: products)),
      );
    });
  }

  Future<void> _onDeleteProduct(
    DeleteProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(LoadingState());
    final result = await deleteProduct(event.productId);

    result.fold((failure) => emit(ErrorState(message: failure.message)), (
      _,
    ) async {
      final productsResult = await getAllProducts();
      productsResult.fold(
        (failure) => emit(ErrorState(message: failure.message)),
        (products) => emit(LoadedAllProductState(products: products)),
      );
    });
  }
}
