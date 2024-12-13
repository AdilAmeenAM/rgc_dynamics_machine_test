import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routePath = "/home";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Name and location
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'SULFA SALOOB',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      'Kozhikode Kerala',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                // Profile icon
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.red,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                        'https://api-machine-test.hilalcart.com/media/ProfilePic/RDT_20231225_1047423382430035868934349_zHiMpSI.jpg'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
