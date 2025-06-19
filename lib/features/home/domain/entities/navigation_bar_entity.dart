import 'package:fruit_hup/core/utils/assets.dart';

class NavigationBarEntity {
  NavigationBarEntity({
    required this.activeImage,
    required this.notActiveImage,
    required this.name,
  });

  final String activeImage;
  final String notActiveImage;
  final String name;
}

List<NavigationBarEntity> navigationBarIcons = [
  NavigationBarEntity(
    activeImage: Assets.imageIconsBoldHome,
    notActiveImage: Assets.imageIconsOutlineHome,
    name: 'الرئيسية',
  ),
  NavigationBarEntity(
    activeImage: Assets.imageIconsBoldProdacte,
    notActiveImage: Assets.imageIconsOutlineProdacte,
    name: 'المنتجات',
  ),
  NavigationBarEntity(
    activeImage: Assets.imageIconsBoldShopping,
    notActiveImage: Assets.imageIconsOutlineShopping,
    name: 'سلة التسوق',
  ),
  NavigationBarEntity(
    activeImage: Assets.imageIconsBoldUser,
    notActiveImage: Assets.imageIconsOutlineUser,
    name: 'حسابي',
  ),
];