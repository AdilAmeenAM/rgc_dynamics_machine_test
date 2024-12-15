import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rgc_dynamics_machine_test/core/utils/snackbar_utils.dart';
import 'package:rgc_dynamics_machine_test/features/home/models/food_product_model.dart';

class FoodProductService {
  static final Dio _dio = Dio();

  static Future<List<FoodProductModel>> getFoodProducts() async {
    try {
      final response =
          await _dio.get('https://api-machine-test.hilalcart.com/food/list');
      if (response.statusCode == 200) {
        List<dynamic> results = response.data['results'];
        final productList =
            results.map((json) => FoodProductModel.fromJson(json)).toList();
        return productList;
      } else {
        throw Exception('Failed to load food products');
      }
    } catch (e) {
      throw Exception('Error fetching food products: $e');
    }
  }

  static Future<String> uploadImage(File imageFile) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile.path,
            filename: imageFile.path.split('/').last),
      });

      final response = await _dio
          .post('https://api.escuelajs.co/api/v1/files/upload', data: formData);

      if (response.statusCode == 201) {
        return response.data["location"];
      } else {
        throw Exception('Failed to upload image');
      }
    } catch (e) {
      throw Exception('Error uploading image: $e');
    }
  }

  static Future<void> createFoodProduct(
      Map<String, dynamic> productData) async {
    try {
      final response = await _dio.post(
        'https://api-machine-test.hilalcart.com/food/create',
        data: productData,
      );

      if (response.statusCode == 200) {
        final responseCode = response.data['response_code'];

        if (responseCode == 201) {
          // Show success message
          SnackBarUtils.showMessage('Product created successfully!');
        } else if (responseCode == 400) {
          // Show error message
          SnackBarUtils.showMessage('Product already exists!');
        } else {
          // Handle unexpected response codes
          SnackBarUtils.showMessage('Unexpected error occurred.');
        }
      } else {
        throw Exception('Failed to create food product');
      }
    } catch (e) {
      SnackBarUtils.showMessage('Uploading failed');
    }
  }

  // static Future<FoodProductModel> createFoodProduct(
  //     Map<String, dynamic> productData) async {
  //   try {
  //     final response = await _dio.post(
  //       'https://api-machine-test.hilalcart.com/food/create',
  //       data: productData,
  //     );

  //     if (response.statusCode == 200) {

  //       final result = FoodProductModel.fromJson(response.data);
  //       return result;
  //     } else {
  //       throw Exception('Failed to create food product');
  //     }
  //   } catch (e) {
  //     throw Exception('Error creating food product: $e');
  //   }
  // }
}
