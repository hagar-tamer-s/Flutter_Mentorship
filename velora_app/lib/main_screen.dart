import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora_app/core/constants/custom_bottom_nav_bar.dart';
import 'package:velora_app/features/categories/presentation/screens/categories_screen.dart';
import 'package:velora_app/features/products/presentation/cubit/product_cubit.dart';
import 'package:velora_app/features/products/presentation/screens/products_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [ProductsScreen(), CategoriesScreen()];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: Scaffold(
        body: screens[currentIndex],

        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
