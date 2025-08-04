part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

// events are the use interaction

class LoadAllProductEvent extends ProductEvent {}

class GetSingleProductEvent extends ProductEvent {
  final String productId;
  const GetSingleProductEvent(this.productId);
}

class UpdateProductEvent extends ProductEvent {
  final Product product;
  const UpdateProductEvent(this.product);
}

class DeleteProductEvent extends ProductEvent {
  final String productId;
  const DeleteProductEvent(this.productId);
}

class CreateProductEvent extends ProductEvent {
  final Product product;
  const CreateProductEvent(this.product);
}
