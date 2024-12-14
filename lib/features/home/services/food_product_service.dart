import 'package:dio/dio.dart';
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
}
