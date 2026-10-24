import 'package:flutter/material.dart';
import 'package:velora_app/features/data/model/product_model.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBF8FC),
      appBar: AppBar(
        backgroundColor: Color(0xffFBF8FC),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Row(
          spacing: 4,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                height: 50,
                width: 50,
                "assets/images/Velora Brand Logo.png",
              ),
            ),
            Text(
              product.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.coverPictureUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 400,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff837470),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffF0EDF1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    child: Row(
                      spacing: 2,
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Text(
                          "${product.rating.toStringAsFixed(2)} (${product.reviewsCount})",

                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff41657d),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                product.description,
                maxLines: 2,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    "\$${product.price.toString()}",

                    style: TextStyle(
                      color: Color(0xff8E655B),
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffD5EBFD),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    child: Text(
                      "${product?.stock.toString() ?? 0} units left",

                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff41657d),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "Available Color: ${product.color}",

                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff594D49),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
