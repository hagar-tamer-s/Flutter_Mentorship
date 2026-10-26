import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora_app/core/constants/custom_app_bar.dart';
import 'package:velora_app/core/constants/custom_search_bar.dart';
import 'package:velora_app/features/products/presentation/cubit/product_cubit.dart';
import 'package:velora_app/features/products/presentation/cubit/product_states.dart';
import 'package:velora_app/features/products/presentation/widgets/products_grid_view.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductCubit>(context).getProducts();
  }

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
            spacing: 15,
            children: [
              CustomSearchBar(),
              BlocBuilder<ProductCubit, ProductStates>(
                builder: (context, state) {
                  if (state is ProductLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Color(0xffE0A899),
                      ),
                    );
                  } else if (state is ProductFailureState) {
                    return Center(
                      child: Text(
                        "something went wrong",
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (state is ProductSuccessState) {
                    return Expanded(
                      child: ProductsGridView(products: state.product),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
