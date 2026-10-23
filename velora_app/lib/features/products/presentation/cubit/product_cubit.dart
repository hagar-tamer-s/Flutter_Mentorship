import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora_app/features/data/data_source.dart';
import 'package:velora_app/features/products/presentation/cubit/product_states.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitialState());
  final DataSource data = DataSource();

  Future<void> getProducts() async {
    emit(ProductLoadingState());

    await data.getProducts().then(
      (val) {
        emit(ProductSuccessState(product: val));
      },
      onError: (error) {
        print(error.toString());
        emit(ProductFailureState());
      },
    );
  }
}
