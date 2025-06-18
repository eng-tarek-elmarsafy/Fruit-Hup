import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hup/core/helper/is_arabic.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/core/utils/assets.dart';
import 'package:fruit_hup/generated/l10n.dart';

class SearchFor extends StatelessWidget {
  const SearchFor({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 9,
              offset: Offset(0, 2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: SearchBar(
          elevation: WidgetStateProperty.all<double>(0),
          backgroundColor: const WidgetStatePropertyAll<Color>(Colors.white),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          hintText: S.of(context).SearchFor,
          hintStyle: WidgetStateProperty.all<TextStyle?>(AppStyle.smallRegular),
          leading: Padding(
            padding: EdgeInsets.only(
              left: isArabic() ? 16 : 0,
              right: isArabic() ? 0 : 16,
            ),
            child: SvgPicture.asset(Assets.imageSearchIcon),
          ),
          trailing: [SvgPicture.asset(Assets.imageSettingIcon)],
        ),
      ),
    );
  }
}
