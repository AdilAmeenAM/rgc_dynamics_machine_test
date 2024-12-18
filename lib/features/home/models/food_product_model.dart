class FoodProductModel {
  final int? id;
  final String? name;
  final String? price;
  final String? description;
  final String? category;
  final Weights? weights;
  final Barcode? barcode;
  final String? code;
  final double? rating;
  final String? image;

  FoodProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.category,
    this.weights,
    this.barcode,
    this.code,
    this.rating,
    this.image,
  });

  factory FoodProductModel.fromJson(Map<String, dynamic> json) {
    return FoodProductModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      weights:
          json['weights'] != null ? Weights.fromJson(json['weights']) : null,
      barcode:
          json['barcode'] != null ? Barcode.fromJson(json['barcode']) : null,
      code: json['code'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'category': category,
      'weights': weights?.toJson(),
      'barcode': barcode?.toJson(),
      'rating': rating,
      'image': image,
    };
  }
}

class Weights {
  final double? netWeight;
  final double? grossWeight;

  Weights({
    this.netWeight,
    this.grossWeight,
  });

  factory Weights.fromJson(Map<String, dynamic> json) {
    return Weights(
      netWeight: (json['net_weight'] as num?)?.toDouble(),
      grossWeight: (json['gross_weight'] as num?)?.toDouble(),
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
  final double? barcodeNumber;

  Barcode({this.barcodeNumber});

  factory Barcode.fromJson(Map<String, dynamic> json) {
    return Barcode(
      barcodeNumber: (json['barcode_number'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'barcode_number': barcodeNumber,
    };
  }
}
