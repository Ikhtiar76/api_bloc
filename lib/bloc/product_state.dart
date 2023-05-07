part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitialState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoadingState extends ProductState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ProductLoadedState extends ProductState {
  List<ProductModel> productData;

  ProductLoadedState(this.productData);
  @override
  List<Object> get props => [productData];
}

class ProductLoadFailure extends ProductState {
  final String message;

  const ProductLoadFailure({required this.message});
  @override
  List<Object> get props => [message];
}
