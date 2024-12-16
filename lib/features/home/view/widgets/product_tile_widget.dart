import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rgc_dynamics_machine_test/features/home/models/food_product_model.dart';

class ProductTileWidget extends StatelessWidget {
  final String name;
  final String price;
  final double padding;
  final double rating;
  final int id;
  final FoodProductModel item;

  const ProductTileWidget({
    super.key,
    required this.name,
    required this.price,
    required this.padding,
    required this.rating,
    required this.id,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final dataBox = Hive.box('favorite');
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name, // Replace with actual name
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "$rating", // Replace with actual rating
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  ValueListenableBuilder(
                      valueListenable: dataBox.listenable(),
                      builder: (contex, value, _) {
                        int key = id;
                        Map food = item.toJson();
                        bool saved = dataBox.containsKey(key);
                        if (saved) {
                          return IconButton(
                            onPressed: () {
                              dataBox.delete(key);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      duration: Duration(seconds: 1),
                                      content: Text('Deleted from favorites')));
                            },
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          );
                        } else {
                          return IconButton(
                            onPressed: () {
                              dataBox.put(key, food);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      duration: Duration(seconds: 1),
                                      content: Text('Added to fevorites')));
                            },
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                            ),
                          );
                        }
                      }),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            price, // Replace with actual price
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}
