import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc(this.productRepository) : super(InitialState()) {
    on<LoadAllProductEvent>(_onLoadAllProducts);
    on<GetSingleProductEvent>(_onGetSingleProduct);
    on<CreateProductEvent>(_onCreateProduct);
    on<UpdateProductEvent>(_onUpdateProduct);
    on<DeleteProductEvent>(_onDeleteProduct);
  }

  Future<void> _onLoadAllProducts(
    LoadAllProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(LoadingState());
    final result = await productRepository.getAllProducts();

    result.fold(
      (failure) => emit(ErrorState(message: 'some failure occured')),
      (products) => emit(LoadedAllProductState(products: products)),
    );
  }

  Future<void> _onGetSingleProduct(
    GetSingleProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(LoadingState());
    final result = await productRepository.getProductById(event.productId);

    result.fold(
      (failure) =>
          emit(ErrorState(message: 'error occured while fetching the product')),
      (product) => emit(LoadedSingleProductState(product: product)),
    );
  }

  Future<void> _onCreateProduct(
    CreateProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(LoadingState());
    final result = await productRepository.createProduct(event.product);

    result.fold(
      (failure) =>
          emit(ErrorState(message: 'error occured while creating new product')),
      (_) async {
        final productsResult = await productRepository.getAllProducts();
        productsResult.fold(
          (failure) => emit(
            ErrorState(message: 'error occured while creating new product'),
          ),
          (products) => emit(LoadedAllProductState(products: products)),
        );
      },
    );
  }

  Future<void> _onUpdateProduct(
    UpdateProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(LoadingState());
    final result = await productRepository.updateProduct(event.product);

    result.fold(
      (failure) =>
          emit(ErrorState(message: 'error occured while updating the product')),
      (_) async {
        final productsResult = await productRepository.getAllProducts();
        productsResult.fold(
          (failure) => emit(
            ErrorState(message: 'error occured while updating the product'),
          ),
          (products) => emit(LoadedAllProductState(products: products)),
        );
      },
    );
  }

  Future<void> _onDeleteProduct(
    DeleteProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(LoadingState());
    final result = await productRepository.deleteProduct(event.productId);

    result.fold(
      (failure) =>
          emit(ErrorState(message: 'error occured while deleted the product')),
      (_) async {
        final productsResult = await productRepository.getAllProducts();
        productsResult.fold(
          (failure) => emit(
            ErrorState(message: 'error occured while deleting the product'),
          ),
          (products) => emit(LoadedAllProductState(products: products)),
        );
      },
    );
  }
}
