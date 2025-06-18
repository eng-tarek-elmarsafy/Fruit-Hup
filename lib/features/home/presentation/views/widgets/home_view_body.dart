import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fruit_hup/core/helper/is_arabic.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/core/utils/assets.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/search_for.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          CustomAppBar(),
          SizedBox(height: 16),
          SearchFor(),
          SizedBox(height: 12),
          FeatureWidget(),
        ],
      ),
    );
  }
}

class FeatureWidget extends StatelessWidget {
  const FeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width * .95,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Image.asset(Assets.imageFeatuerImageTest, fit: BoxFit.fill),
              Container(
                width: width * .46,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: Svg(Assets.imageFeatuerSvg),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    right: isArabic() ? 27 : 0,
                    left: isArabic() ? 0 : 27,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      Text(
                        'عروض العيد',
                        style: AppStyle.smallRegular.copyWith(
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'خصم 25%',
                        style: AppStyle.largeBold.copyWith(
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                      const SizedBox(height: 7),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFFFFFFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 4,
                          ),
                          child: FittedBox(
                            child: Text('تسوق الان', style: AppStyle.smallBold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 29),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
