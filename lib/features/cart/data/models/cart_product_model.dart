import 'package:ecommerce/core/models/brand_model.dart';
import 'package:ecommerce/core/models/category_model.dart';

class CartProductModel {
  final String id;
  final String title;
  final int? quantity;
  final String imageCoverURL;
  final CategoryModel category;
  final BrandModel brand;
  final double ratingsAverage;

  const CartProductModel({
    required this.id,
    required this.title,
    required this.quantity,
    required this.imageCoverURL,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['_id'] as String,
      title: json['title'] as String,
      quantity: json['quantity'] as int?,
      imageCoverURL: json['imageCover'] as String,
      category: CategoryModel.fromJson(json['category']),
      brand: BrandModel.fromJson(json['brand']),
      ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
    );
  }
}
