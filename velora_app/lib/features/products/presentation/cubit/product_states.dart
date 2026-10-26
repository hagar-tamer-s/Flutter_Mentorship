import 'package:velora_app/features/data/model/product_model.dart';

abstract class ProductStates {}

class ProductInitialState extends ProductStates {}

class ProductLoadingState extends ProductStates {}

class ProductSuccessState extends ProductStates {
  final List<ProductModel> product;
  ProductSuccessState({required this.product});
}

class ProductFailureState extends ProductStates {}

class DeleteProductLoading extends ProductStates {}

class DeleteProductFailure extends ProductStates {}

class DeleteProductSuccess extends ProductStates {}
