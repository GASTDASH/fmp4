import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmp4/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar my_appbar(
    {bool backButton = false, Function()? onPressedBack, String title = ""}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    elevation: 4,
    shadowColor: Colors.black45,
    centerTitle: true,
    title: Text(
      title,
      style: MyTextStyles.subtitleMedium16.copyWith(
        color: MyColors.grayDark,
      ),
    ),
    leading: backButton
        ? IconButton(
            icon: SvgPicture.asset(
              "assets/icons/linear/arrow-square-left.svg",
              height: 20.sp,
              color: MyColors.primary,
            ),
            onPressed: onPressedBack != null ? onPressedBack : () {},
          )
        : null,
  );
}
