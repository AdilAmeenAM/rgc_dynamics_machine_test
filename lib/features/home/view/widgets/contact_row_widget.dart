import 'package:flutter/material.dart';

class ContactRowWidget extends StatelessWidget {
  final IconData icon;
  final String info;

  const ContactRowWidget({super.key, required this.icon, required this.info});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey[200],
          child: Icon(icon, color: Colors.black54),
        ),
        const SizedBox(width: 15),
        Flexible(
          child: Text(
            info,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
