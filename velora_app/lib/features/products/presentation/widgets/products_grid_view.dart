import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora_app/features/products/presentation/cubit/product_cubit.dart';
import 'package:velora_app/features/products/presentation/cubit/product_states.dart';
import 'package:velora_app/features/products/presentation/screens/product_details.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({super.key});

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductStates>(
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return Center(
            child: CircularProgressIndicator(color: Color(0xffE0A899)),
          );
        } else if (state is ProductFailureState) {
          return Center(
            child: Text(
              "something went wrong",
              style: TextStyle(color: Colors.red),
            ),
          );
        } else if (state is ProductSuccessState) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.48,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemCount: state.product.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetails(product: state.product[index]),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Color(0xffffffff),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                // "assets/images/High-Fashion Magazine _The Jewellery Edit _ A Little Luxury.jpg",
                                state.product[index].coverPictureUrl,
                                height: 220,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: IconButton(
                                onPressed: () {},
                                icon: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.delete_outline,
                                    color: Color(0xffE0A899),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          state.product[index].name,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff837470),
                          ),
                        ),
                        Text(
                          state.product[index].description,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${state.product[index].price}",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_circle,
                                color: Color(0xffBDE2FD),
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
