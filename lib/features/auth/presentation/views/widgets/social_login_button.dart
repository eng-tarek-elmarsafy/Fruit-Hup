import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_style.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({super.key, required this.title, required this.logo});
  final String title, logo;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffffffff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color(0xffDDDFDF), width: 1),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(logo),
            Expanded(
              child: Align(
                child: Text(
                  title,
                  style: AppStyle.smallBold.copyWith(color: AppColor.gray950),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
