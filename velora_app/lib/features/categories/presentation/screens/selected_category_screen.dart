import 'package:flutter/material.dart';
import 'package:velora_app/core/constants/custom_search_bar.dart';
import 'package:velora_app/features/products/presentation/widgets/products_grid_view.dart';

class SelectedCategoryScreen extends StatelessWidget {
  const SelectedCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBF8FC),

      appBar: AppBar(
        backgroundColor: Color(0xffFBF8FC),

        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "CATEGORY NAME",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchBar(),
              Text(
                "6 items",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff837470),
                ),
              ),
              Expanded(child: ProductsGridView()),
            ],
          ),
        ),
      ),
    );
  }
}
