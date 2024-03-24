import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract final class MyColors {
  static Color primary = Color(0xFF0560fa);
  static Color secondary = Color(0xFFEC8000);
  static Color success = Color(0xFF35B369);
  static Color warning = Color(0xFFEBBC2E);
  static Color info = Color(0xFF2f80ed);
  static Color error = Color(0xFFed3a33a);
  static Color textLight = Color(0xFF3a3a3a);
  static Color textDark = Color(0xFF141414);
  static Color grayLight = Color(0xFFcfcfcf);
  static Color grayDark = Color(0xFFa7a7a7);
}

class MyTextStyles {
  static TextStyle headingBold24 =
      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700);
  static TextStyle headingMedium24 =
      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500);
  static TextStyle subtitleBold16 =
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700);
  static TextStyle subtitleMedium16 =
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500);
  static TextStyle bodyRegular16 =
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400);
  static TextStyle bodyRegular14 =
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400);
  static TextStyle bodyRegular12 =
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400);
  static TextStyle button1 =
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700);
  static TextStyle bodyMedium14 =
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500);
  static TextStyle bodyMedium12 =
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500);
}
