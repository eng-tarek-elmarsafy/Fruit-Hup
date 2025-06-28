import 'package:fruit_hup/features/home/data/models/review_model.dart';
import 'package:fruit_hup/features/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'] as String,
      price: json['price'] as String,
      code: json['code'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String?,

      isFeatured: json['isFeatured'] as bool,
      expirationsMonths: json['expirationsMonths'] as int,
      isOrganic: json['isOrganic'] as bool,
      numberOfCaloris: json['numberOfCaloris'] as int,
      avgRating: (json['avgRating'] ?? 0) as num,
      ratingCount: (json['ratingCount'] ?? 0) as num,
      unitAmount: (json['unitAmount'] ?? 0) as num,
      review:
          (json['review'] as List<dynamic>)
              .map((e) => ReviewModel.fromJson(e))
              .toList(),
    );
  }
  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      name: entity.name,
      price: entity.price,
      code: entity.code,
      description: entity.description,
      imageUrl: entity.imageUrl,
      isFeatured: entity.isFeatured,
      expirationsMonths: entity.expirationsMonths,
      isOrganic: entity.isOrganic,
      numberOfCaloris: entity.numberOfCaloris,
      avgRating: entity.avgRating,
      unitAmount: entity.unitAmount,
      ratingCount: entity.ratingCount,
      review: entity.review,
    );
  }
  ProductModel({
    required super.name,
    required super.price,
    required super.code,
    required super.description,
    super.imageUrl,
    required super.isFeatured,
    required super.expirationsMonths,
    required super.isOrganic,
    required super.numberOfCaloris,
    super.avgRating = 0,
    super.ratingCount = 0,
    required super.unitAmount,
    required super.review,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'code': code,
      'isFeatured': isFeatured,
      'isOrganic': isOrganic,
      'numberOfCaloris': numberOfCaloris,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'unitAmount': unitAmount,
      'expirationsMonths': expirationsMonths,
      'description': description,
      'imageUrl': imageUrl,
      'review':
          review.map((e) => ReviewModel.fromReviewEntity(e).toJson()).toList(),
    };
  }
}
