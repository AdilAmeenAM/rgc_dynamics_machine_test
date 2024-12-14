import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final String name;
  final String price;
  final double padding;
  final double rating;
  const ProductTileWidget(
      {super.key,
      required this.name,
      required this.price,
      required this.padding,
      required this.rating});

  @override
  Widget build(BuildContext context) {
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
                  const Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                  ),
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
