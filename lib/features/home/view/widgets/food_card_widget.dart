import 'package:flutter/material.dart';
import 'package:rgc_dynamics_machine_test/features/home/models/food_product_model.dart';
import 'package:rgc_dynamics_machine_test/features/home/view/widgets/product_tile_widget.dart';

class FoodCardWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final double rating;
  final int id;
  final FoodProductModel item;

  const FoodCardWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.rating,
    required this.id,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.9;
    final cardHeight = cardWidth * 0.85;

    return Center(
      child: Container(
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          border: Border.all(width: .5, color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                imageUrl,
                height: cardHeight * 0.7,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return SizedBox(
                    height: cardHeight * 0.7,
                    child: const Text("Image is not found"),
                  );
                },
              ),
            ),
            ProductTileWidget(
              name: name,
              price: price,
              padding: 6,
              rating: rating,
              id: id,
              item: item,
            ),
          ],
        ),
      ),
    );
  }
}
