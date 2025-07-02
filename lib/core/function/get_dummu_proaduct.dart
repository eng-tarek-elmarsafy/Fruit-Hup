import 'package:fruit_hup/features/home/domain/entities/product_entity.dart';

ProaductEntity getDummyProaduct() {
  return ProaductEntity(
    isFeatured: false,
    name: 'Apple',
    imageUrl: null,
    description: 'Fresh and juicy apples.',
    price: '1.99',
    code: 'AP123',
    expirationsMonths: 12,
    isOrganic: false,
    numberOfCaloris: 52,
    unitAmount: 1,
    review: [],
  );
}
