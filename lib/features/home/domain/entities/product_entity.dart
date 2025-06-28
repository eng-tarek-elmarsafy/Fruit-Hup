import 'package:fruit_hup/features/home/domain/entities/review_entity.dart';

class ProductEntity {
  ProductEntity({
    required this.isFeatured,
    required this.name,
    required this.price,
    required this.code,
    required this.description,
    this.imageUrl,
    required this.expirationsMonths,
    required this.isOrganic,
    required this.numberOfCaloris,
    this.avgRating = 0,
    this.ratingCount = 0,
    required this.unitAmount,
    required this.review,
  });
  final String name;
  final String price;
  final String code;
  final String description;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCaloris;
  final num avgRating;
  final num ratingCount;
  final num unitAmount;
  final List<ReviewEntity> review;
}
