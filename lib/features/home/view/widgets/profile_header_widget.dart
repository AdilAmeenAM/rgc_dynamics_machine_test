import 'package:flutter/material.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String profilePhoto;
  const ProfileHeaderWidget(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.profilePhoto});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        const Divider(height: 2),
        Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Name and location
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$firstName $lastName',
                    style: const TextStyle(
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
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.red,
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(profilePhoto),
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 2)
      ],
    );
  }
}
