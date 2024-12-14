class FoodProductModel {
  final int id;
  final String name;
  final String price;
  final String description;
  final String category;
  final Weights weights;
  final Barcode barcode;
  final String code;
  final double rating;
  final String image;

  FoodProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.weights,
    required this.barcode,
    required this.code,
    required this.rating,
    required this.image,
  });

  // Factory constructor to create an object from JSON
  factory FoodProductModel.fromJson(Map<String, dynamic> json) {
    return FoodProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      weights: Weights.fromJson(json['weights']),
      barcode: Barcode.fromJson(json['barcode']),
      code: json['code'],
      rating: json['rating'].toDouble(),
      image: json['image'],
    );
  }

  // Method to convert the object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'category': category,
      'weights': weights.toJson(),
      'barcode': barcode.toJson(),
      'code': code,
      'rating': rating,
      'image': image,
    };
  }
}

class Weights {
  final double netWeight; // Changed from int to double
  final double grossWeight; // Changed from int to double

  Weights({
    required this.netWeight,
    required this.grossWeight,
  });

  factory Weights.fromJson(Map<String, dynamic> json) {
    return Weights(
      netWeight: (json['net_weight'] as num).toDouble(), // Convert to double
      grossWeight:
          (json['gross_weight'] as num).toDouble(), // Convert to double
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'net_weight': netWeight,
      'gross_weight': grossWeight,
    };
  }
}

class Barcode {
  final double barcodeNumber; // Changed from int to double

  Barcode({required this.barcodeNumber});

  factory Barcode.fromJson(Map<String, dynamic> json) {
    return Barcode(
      barcodeNumber:
          (json['barcode_number'] as num).toDouble(), // Convert to double
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'barcode_number': barcodeNumber,
    };
  }
}
