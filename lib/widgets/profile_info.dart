import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fmp4/main.dart';
import 'package:fmp4/theme.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return profileInfo();
  }

  Widget profileInfo() {
    return Row(
      children: [
        SizedBox(
          height: 60.sp,
          width: 60.sp,
          child: CircleAvatar(
            backgroundColor: MyColors.grayDark,
            foregroundImage: AssetImage("assets/avatars/ava2.png"),
          ),
        ),
        SizedBox(width: 5.sp),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello ${myProfile.fullname}",
              style: TextStyle(
                  color: MyColors.textLight,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              showBalance
                  ? "Current balance: ${myProfile.balance}"
                  : "Current balance: ******",
              style: MyTextStyles.bodyRegular12
                  .copyWith(color: MyColors.textLight),
            ),
          ],
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                setState(() {
                  showBalance = !showBalance;
                });
              },
              icon: SvgPicture.asset("assets/icons/linear/eye-slash.svg"),
            ),
          ),
        ),
      ],
    );
  }
}
