import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rgc_dynamics_machine_test/core/utils/snackbar_utils.dart';
import 'package:rgc_dynamics_machine_test/features/home/models/food_product_model.dart';
import 'package:rgc_dynamics_machine_test/features/home/services/food_product_service.dart';
import 'package:rgc_dynamics_machine_test/features/home/view/widgets/product_tile_widget.dart';
import 'package:rgc_dynamics_machine_test/main.dart';

class FoodDetailsPage extends StatelessWidget {
  static const routePath = "/detailspage";
  final FoodProductModel productModel;

  const FoodDetailsPage({
    super.key,
    required this.productModel,
  });

  Future<void> _deleteProduct(
      BuildContext context, int id, Box<dynamic> dataBox) async {
    try {
      // Call the delete service
      await FoodProductService.deleteFoodProduct(id.toString());

      // Remove the item from the Hive dataBox using its ID
      if (dataBox.containsKey(id)) {
        await dataBox.delete(id);
      }

      // Show a success message
      SnackBarUtils.showMessage('Product deleted successfully!');
      // Navigate back to the previous screen
      App.navigatorKey.currentContext!.pop();
    } catch (e) {
      // Show an error message
      SnackBarUtils.showMessage('Failed to delete product: $e');
    }
  }

  void _showDeleteDialog(BuildContext context, int id, final dataBox) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Product"),
          content: const Text("Are you sure you want to delete this product?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _deleteProduct(context, id, dataBox);
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final dataBox = Hive.box('favorite');
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
                      productModel.image ?? "",
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
                      id: productModel.id ?? 0,
                      name: productModel.name ?? "",
                      price: productModel.price ?? "",
                      padding: 0,
                      rating: 1.2,
                      item: productModel,
                    ),
                    const SizedBox(height: 20),
                    Divider(color: Colors.grey.shade300),
                    const SizedBox(height: 20),
                    const Text(
                      "Description",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      productModel.description ?? "",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Details",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text("Net Weight : ${productModel.weights?.netWeight}",
                        style: const TextStyle(color: Colors.grey)),
                    Text("Gross Weight : ${productModel.weights?.grossWeight}",
                        style: const TextStyle(color: Colors.grey)),
                    Text(
                        "Barcode Number : ${productModel.barcode?.barcodeNumber}",
                        style: const TextStyle(color: Colors.grey)),
                    const Spacer(),
                    // Delete Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _showDeleteDialog(
                            context, productModel.id!, dataBox),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: const Text(
                          "Delete Product",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
