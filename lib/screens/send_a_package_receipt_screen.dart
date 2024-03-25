import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmp4/screens/send_a_package_screen.dart';
import 'package:fmp4/theme.dart';
import 'package:fmp4/widgets/appbar.dart';

class SendAPackageReceiptScreen extends StatefulWidget {
  const SendAPackageReceiptScreen({super.key});

  @override
  State<SendAPackageReceiptScreen> createState() =>
      _SendAPackageReceiptScreenState();
}

class _SendAPackageReceiptScreenState extends State<SendAPackageReceiptScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: my_appbar(
          backButton: true,
          onPressedBack: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SendAPackageScreen()));
          },
          title: "Send a package",
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.sp),
              Text(
                "Package Information",
                style: MyTextStyles.subtitleMedium16
                    .copyWith(color: MyColors.primary),
              ),
              SizedBox(height: 8.sp),
              Text(
                "Origin details",
                style: MyTextStyles.bodyRegular12.copyWith(
                  color: MyColors.textLight,
                ),
              ),
              Text(
                "Destination details",
                style: MyTextStyles.bodyRegular12.copyWith(
                  color: MyColors.textLight,
                ),
              ),
              Text(
                "Other details",
                style: MyTextStyles.bodyRegular12.copyWith(
                  color: MyColors.textLight,
                ),
              ),
              Divider(color: MyColors.grayDark),
              Text(
                "Charges",
                style: MyTextStyles.subtitleMedium16
                    .copyWith(color: MyColors.primary),
              ),
              Divider(color: MyColors.grayDark),
              SizedBox(height: 20.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  editPackageButton(),
                  makePaymentButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget editPackageButton() {
    return SizedBox(
      height: 48.sp,
      width: 158.sp,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: MyColors.primary,
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: MyColors.primary,
            ),
            borderRadius: BorderRadius.circular(8.sp),
          ),
        ),
        child: Text(
          "Edit package",
          style: MyTextStyles.subtitleBold16.copyWith(
            color: MyColors.primary,
          ),
        ),
      ),
    );
  }

  Widget makePaymentButton() {
    return SizedBox(
      height: 48.sp,
      width: 158.sp,
      child: FilledButton(
        onPressed: () {},
        style: FilledButton.styleFrom(
          backgroundColor: MyColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.sp),
          ),
        ),
        child: Text(
          "Make payment",
          style: MyTextStyles.subtitleBold16.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
