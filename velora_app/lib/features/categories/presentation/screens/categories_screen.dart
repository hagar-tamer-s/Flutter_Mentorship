import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora_app/core/constants/custom_app_bar.dart';
import 'package:velora_app/core/constants/custom_search_bar.dart';
import 'package:velora_app/features/categories/presentation/cubit/category_cubit.dart';
import 'package:velora_app/features/categories/presentation/widgets/categories_list_view.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBF8FC),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: CustomAppBar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              CustomSearchBar(),
              Text(
                "CATEGORIES",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff9fa6b2),
                ),
              ),
              Expanded(
                child: BlocProvider(
                  create: (context) => CategoryCubit()..getCategory(),
                  child: CategoriesListView(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
