import 'package:rgc_dynamics_machine_test/core/utils/snackbar_utils.dart';
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

      return foodProductList;
    } catch (e) {
      return [];
    }
  }

  Future<void> creatFoodProduct(Map<String, dynamic> productData) async {
    try {
      await FoodProductService.createFoodProduct(productData);
    } catch (e) {
      SnackBarUtils.showMessage('Uploading failed');
    }
  }
}
