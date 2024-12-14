import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rgc_dynamics_machine_test/features/home/models/food_product_model.dart';
import 'package:rgc_dynamics_machine_test/features/home/view/widgets/product_tile_widget.dart';

class FoodDetailsPage extends StatelessWidget {
  static const routePath = "/detailspage";
  final FoodProductModel productModel;
  const FoodDetailsPage({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: width * 0.83,
                width: width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      productModel.image,
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.white,
                        size: 35,
                      )),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                  padding: const EdgeInsets.all(24),
                  height: height * 0.6,
                  width: width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTileWidget(
                          name: productModel.name,
                          price: productModel.price,
                          padding: 0,
                          rating: 1.2),
                      const SizedBox(height: 20),
                      Divider(color: Colors.grey.shade300),
                      const SizedBox(height: 20),
                      const Text(
                        "Description",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        productModel.description,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text("Net Weight : ${productModel.weights.netWeight}",
                          style: const TextStyle(color: Colors.grey)),
                      Text("Gross Weight : ${productModel.weights.grossWeight}",
                          style: const TextStyle(color: Colors.grey)),
                      Text(
                          "Barcode Number : ${productModel.barcode.barcodeNumber}",
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
