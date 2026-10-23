import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora_app/features/categories/presentation/cubit/category_cubit.dart';
import 'package:velora_app/features/categories/presentation/cubit/category_status.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryStatus>(
      builder: (context, state) {
        if (state is CategoryLoadingState) {
          return Center(
            child: CircularProgressIndicator(color: Color(0xffE0A899)),
          );
        } else if (state is CategoryFailureState) {
          return Center(
            child: Text(
              "Something went wrong",
              style: TextStyle(color: Colors.red),
            ),
          );
        } else if (state is CategorySuccessState) {
          return ListView.builder(
            itemCount: state.cat.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(12),
                width: double.infinity,
                child: Row(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        // "assets/images/High-Fashion Magazine _The Jewellery Edit _ A Little Luxury.jpg",
                        state.cat[index].coverPictureUrl,

                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 80,
                            height: 80,
                            color: Colors.grey[300],
                            child: const Icon(
                              Icons.image_not_supported,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            state.cat[index].name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            state.cat[index].description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.end,
                    //   children: [
                    //     Container(
                    //       decoration: BoxDecoration(
                    //         color: Color(0xffBDE2FD),
                    //         borderRadius: BorderRadius.circular(15),
                    //       ),
                    //       padding: EdgeInsets.symmetric(
                    //         horizontal: 8,
                    //         vertical: 6,
                    //       ),
                    //       child: Text(
                    //         state.cat[index].name,
                    //         style: TextStyle(
                    //           fontSize: 10,
                    //           fontWeight: FontWeight.w600,
                    //           color: Color(0xff41657d),
                    //         ),
                    //       ),
                    //     ),
                    //     IconButton(
                    //       onPressed: () {
                    //         Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) => SelectedCategoryScreen(),
                    //           ),
                    //         );
                    //       },
                    //       icon: Icon(Icons.arrow_forward_ios, size: 15),
                    //     ),
                    //   ],
                    // ),
                  ],
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
