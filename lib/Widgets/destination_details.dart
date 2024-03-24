import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fmp4/screens/send_a_package_screen.dart';
import 'package:fmp4/theme.dart';

class DestinationDetails extends StatefulWidget {
  const DestinationDetails({super.key, required this.controllers});

  final List<TextEditingController> controllers;

  @override
  State<DestinationDetails> createState() => _DestinationDetailsState();
}

class _DestinationDetailsState extends State<DestinationDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.sp),
        Row(
          children: [
            SvgPicture.asset(
              "assets/icons/linear/marker.svg",
              height: 16.sp,
            ),
            SizedBox(width: 8.sp),
            Text(
              "Destination Details",
              style: MyTextStyles.bodyMedium14.copyWith(
                color: MyColors.textLight,
              ),
            )
          ],
        ),
        SizedBox(height: 5.sp),
        textFieldDetail(hintText: "Address"),
        textFieldDetail(hintText: "State,Country"),
        textFieldDetail(hintText: "Phone number"),
        textFieldDetail(hintText: "Others"),
        SizedBox(height: 10.sp),
      ],
    );
  }
}
