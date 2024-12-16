import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rgc_dynamics_machine_test/features/authentication/models/user_model.dart';
import 'package:rgc_dynamics_machine_test/features/home/controller/food_product_controller.dart';
import 'package:rgc_dynamics_machine_test/features/home/models/food_product_model.dart';
import 'package:rgc_dynamics_machine_test/features/home/view/pages/food_details_page.dart';
import 'package:rgc_dynamics_machine_test/features/home/view/pages/profile_page.dart';
import 'package:rgc_dynamics_machine_test/features/home/view/pages/upload_food_product_page.dart';
import 'package:rgc_dynamics_machine_test/features/home/view/widgets/food_card_widget.dart';
import 'package:rgc_dynamics_machine_test/features/home/view/widgets/profile_header_widget.dart';

class HomePage extends ConsumerWidget {
  static const routePath = "/home";
  final UserModel user;
  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          GestureDetector(
            onTap: () {
              context.push(ProfilePage.routePath, extra: user);
            },
            child: ProfileHeaderWidget(
              firstName: user.fname,
              lastName: user.lname,
              profilePhoto: user.profilePic,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Trending Foods',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
              InkWell(
                onTap: () {
                  context.push(UploadFoodProductPage.routePath);
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          FutureBuilder<List<FoodProductModel>>(
              future: ref
                  .read(foodProductControllerProvider.notifier)
                  .fetchProducts(),
              builder: (context, snapshot) {
                final foodProducts = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Error: ${snapshot.error}",
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  );
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("No Products available."),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: foodProducts!.length,
                    itemBuilder: (context, index) {
                      final foodProduct = foodProducts[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: GestureDetector(
                          onTap: () {
                            context.push(FoodDetailsPage.routePath,
                                extra: foodProduct);
                          },
                          child: FoodCardWidget(
                            imageUrl: foodProduct.image ?? '',
                            name: foodProduct.name ?? '',
                            price: foodProduct.price ?? '',
                            rating: foodProduct.rating ?? 0.0,
                            id: foodProduct.id ?? 0,
                            item: foodProduct,
                          ),
                        ),
                      );
                    },
                  ),
                );
              })
        ],
      )),
    );
  }
}
