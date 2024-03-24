import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fmp4/screens/home_screen.dart';
import 'package:fmp4/theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 120.sp),
              SizedBox(
                height: 83.sp,
                width: 83.sp,
                child: SvgPicture.asset(
                  "assets/icons/linear/notification.svg",
                  color: MyColors.grayDark,
                ),
              ),
              SizedBox(height: 8.sp),
              SizedBox(
                height: 36.sp,
                width: 201.sp,
                child: Text(
                  "You have no notifications",
                  style: TextStyle(
                    color: MyColors.textLight,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 4,
      shadowColor: Colors.black45,
      centerTitle: true,
      title: Text(
        "Notification",
        style: MyTextStyles.subtitleMedium16.copyWith(
          color: MyColors.grayDark,
        ),
      ),
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/linear/arrow-square-left.svg",
          height: 20.sp,
          color: MyColors.primary,
        ),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeScreen(startPage: 0)));
        },
      ),
    );
  }
}
