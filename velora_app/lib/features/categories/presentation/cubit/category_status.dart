import 'package:velora_app/features/data/model/category_model.dart';

abstract class CategoryStatus {}

class CategorySuccessState extends CategoryStatus {
  final List<CategoryModel> cat;
  CategorySuccessState({required this.cat});
}

class CategoryFailureState extends CategoryStatus {}

class CategoryInitialState extends CategoryStatus {}

class CategoryLoadingState extends CategoryStatus {}
