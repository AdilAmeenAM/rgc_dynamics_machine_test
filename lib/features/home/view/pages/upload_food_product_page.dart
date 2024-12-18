import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rgc_dynamics_machine_test/core/utils/snackbar_utils.dart';
import 'package:rgc_dynamics_machine_test/features/home/models/food_product_model.dart';
import 'package:rgc_dynamics_machine_test/features/home/services/food_product_service.dart';
import 'package:rgc_dynamics_machine_test/features/home/view/widgets/custom_text_field_widget.dart';
import 'package:rgc_dynamics_machine_test/main.dart';

class UploadFoodProductPage extends HookWidget {
  static const routePath = "/upload";
  const UploadFoodProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final pickedImage = useState<File?>(null);
    final ImagePicker picker = ImagePicker();

    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final priceController = useTextEditingController();
    final categoryController = useTextEditingController();
    final grossWeightController = useTextEditingController();
    final netWeightController = useTextEditingController();
    final barcodeController = useTextEditingController();
    final ratingController = useTextEditingController();
    final imageUrl = useState<String?>('');

    Future<void> pickImage() async {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        pickedImage.value = File(image.path);
        imageUrl.value =
            await FoodProductService.uploadImage(pickedImage.value!);
      }
    }

    Future<void> submitForm() async {
      // Check if all fields are filled
      if (nameController.text.isEmpty ||
          descriptionController.text.isEmpty ||
          priceController.text.isEmpty ||
          categoryController.text.isEmpty ||
          grossWeightController.text.isEmpty ||
          netWeightController.text.isEmpty ||
          barcodeController.text.isEmpty ||
          ratingController.text.isEmpty ||
          pickedImage.value == null) {
        // Show SnackBar if any field is empty
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('All fields are required, including the image.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      try {
        Weights weights = Weights(
          netWeight: double.tryParse(netWeightController.text),
          grossWeight: double.tryParse(grossWeightController.text),
        );

        Barcode barcode = Barcode(
          barcodeNumber: double.tryParse(barcodeController.text),
        );

        final requestBody = FoodProductModel(
          name: nameController.text,
          description: descriptionController.text,
          price: priceController.text,
          category: categoryController.text,
          weights: weights,
          barcode: barcode,
          rating: double.tryParse(ratingController.text),
          image: imageUrl.value!,
        ).toJson();

        await FoodProductService.createFoodProduct(requestBody);

        // Show success SnackBar
        SnackBarUtils.showMessage('Product added successfully!');

        // Clear the form after submission
        nameController.clear();
        descriptionController.clear();
        priceController.clear();
        categoryController.clear();
        grossWeightController.clear();
        netWeightController.clear();
        barcodeController.clear();
        ratingController.clear();
        pickedImage.value = null;
        imageUrl.value = null;
        App.navigatorKey.currentContext!.pop();
      } catch (e) {
        SnackBarUtils.showMessage('Failed to add product: $e');
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "ADD ITEM",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              pickedImage.value != null
                  ? InkWell(
                      onTap: pickImage,
                      child: Image.file(
                        pickedImage.value!,
                        width: width,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    )
                  : InkWell(
                      onTap: pickImage,
                      child: Container(
                        color: Colors.grey[200],
                        width: width,
                        height: width * .8,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              size: 150,
                              color: Colors.grey,
                            ),
                            Text(
                              "Upload a Image From Gallery",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                  labelText: "Name", controller: nameController),
              const SizedBox(height: 10),
              CustomTextFieldWidget(
                  labelText: 'Description', controller: descriptionController),
              const SizedBox(height: 10),
              CustomTextFieldWidget(
                labelText: 'Price',
                controller: priceController,
                keybordType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              CustomTextFieldWidget(
                  labelText: 'Category', controller: categoryController),
              const SizedBox(height: 10),
              CustomTextFieldWidget(
                  labelText: 'Gross Weight',
                  controller: grossWeightController,
                  keybordType: TextInputType.number),
              const SizedBox(height: 10),
              CustomTextFieldWidget(
                  labelText: 'Net Weight',
                  controller: netWeightController,
                  keybordType: TextInputType.number),
              const SizedBox(height: 10),
              CustomTextFieldWidget(
                  labelText: 'Barcode Number',
                  controller: barcodeController,
                  keybordType: TextInputType.number),
              const SizedBox(height: 10),
              CustomTextFieldWidget(
                  labelText: 'Rating',
                  controller: ratingController,
                  keybordType: TextInputType.number),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: submitForm,
                child: const Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
