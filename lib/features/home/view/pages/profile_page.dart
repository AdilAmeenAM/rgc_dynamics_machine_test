import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rgc_dynamics_machine_test/features/authentication/models/user_model.dart';
import 'package:rgc_dynamics_machine_test/features/home/view/widgets/contact_row_widget.dart';

class ProfilePage extends StatelessWidget {
  static const routePath = "/profile";
  final UserModel user;
  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none, // Allows overflow outside container
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: width * 0.83,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.red.shade400,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back_sharp,
                              color: Colors.white,
                              size: 35,
                            )),
                        const SizedBox(width: 10),
                        const Text(
                          "Profile",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        )
                      ],
                    ),
                  ],
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
                  children: [
                    const SizedBox(height: 70),

                    const Text(
                      "Shamsun Nahar",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // My Favorites Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "My Favorites",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "15",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Contact Information
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          ContactRowWidget(
                            icon: Icons.phone,
                            info: "+156 906785",
                          ),
                          SizedBox(height: 20),
                          ContactRowWidget(
                            icon: Icons.location_on,
                            info: "1930 Pooh Bear Lane, AUBURN",
                          ),
                          SizedBox(height: 20),
                          ContactRowWidget(
                            icon: Icons.email,
                            info: "shamsunnahar4.20@gmail.com",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Profile Circle - Positioned between red and white containers
            Positioned(
              top: (width * 0.75) - 70, // Adjust to overlap half the avatar
              left: width / 2 - 70, // Center horizontally
              child: const CircleAvatar(
                radius: 75,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  // Adjust background color
                  radius: 70,
                  // Optional
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}