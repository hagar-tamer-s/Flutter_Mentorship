import 'package:flutter/material.dart';
import 'package:velora_app/core/constants/custom_app_bar.dart';
import 'package:velora_app/core/constants/custom_search_bar.dart';
import 'package:velora_app/features/products/presentation/widgets/products_grid_view.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              CustomSearchBar(),
              Expanded(child: ProductsGridView()),
            ],
          ),
        ),
      ),
    );
  }
}
