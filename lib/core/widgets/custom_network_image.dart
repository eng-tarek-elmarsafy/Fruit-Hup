import 'package:flutter/material.dart';
import 'package:fruit_hup/features/home/domain/entities/product_entity.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.proaduct,
  });

  final ProaductEntity proaduct;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      proaduct.imageUrl!,
      fit: BoxFit.contain,
    );
  }
}
