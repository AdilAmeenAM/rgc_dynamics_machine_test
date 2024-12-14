import 'package:rgc_dynamics_machine_test/features/home/models/food_product_model.dart';
import 'package:rgc_dynamics_machine_test/features/home/services/food_product_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_product_controller.g.dart';

@riverpod
class FoodProductController extends _$FoodProductController {
  @override
  String? build() {
    return null;
  }

  Future<List<FoodProductModel>> fetchProducts() async {
    try {
      final foodProductList = await FoodProductService.getFoodProducts();
      // Clear error message if the request succeeds
      state = null;
      return foodProductList;
    } catch (e) {
      state = 'Failed to fetch recipes. Please check your network connection.';
      return [];
    }
  }
}
