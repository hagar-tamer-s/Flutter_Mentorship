import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora_app/features/categories/presentation/cubit/category_status.dart';
import 'package:velora_app/features/data/data_source.dart';

class CategoryCubit extends Cubit<CategoryStatus> {
  CategoryCubit() : super(CategoryInitialState());
  final DataSource data = DataSource();
  Future<void> getCategory() async {
    emit(CategoryLoadingState());
    try {
      final val = await data.getCategories();
      emit(CategorySuccessState(cat: val));
    } catch (e, stackTrace) {
      print("ERROR: $e");
      print("STACK TRACE: $stackTrace");
      emit(CategoryFailureState());
    }
  }
}
