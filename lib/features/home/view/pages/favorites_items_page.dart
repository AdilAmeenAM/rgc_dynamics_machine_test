import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rgc_dynamics_machine_test/features/home/models/food_product_model.dart';

class FavoritesItemPage extends StatelessWidget {
  static const routePath = "/favorite";

  const FavoritesItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataBox = Hive.box('favorite');

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'My Favorites',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search here...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // List of Favorites
          ValueListenableBuilder(
              valueListenable: dataBox.listenable(),
              builder: (context, value, _) {
                return Expanded(
                  child: ListView.separated(
                    itemCount: dataBox.length,
                    separatorBuilder: (context, index) =>
                        const Divider(height: 1, color: Colors.grey),
                    itemBuilder: (context, index) {
                      var data = value.values.toList();
                      var item = data
                          .map((json) => FoodProductModel.fromJson(json))
                          .toList();

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage('${item[index].image}'),
                          radius: 25,
                          backgroundColor: Colors.grey[300],
                        ),
                        title: Text(
                          item[index].name ?? "",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("\$${item[index].price}"),
                        trailing: RichText(
                          text: TextSpan(
                            children: [
                              const WidgetSpan(
                                child: Icon(Icons.star,
                                    color: Colors.amber, size: 16),
                              ),
                              TextSpan(
                                text: ' ${item[index].rating} ',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
