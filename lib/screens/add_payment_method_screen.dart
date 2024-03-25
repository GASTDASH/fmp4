import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmp4/screens/home_screen.dart';
import 'package:fmp4/theme.dart';

class AddPaymentMethodScreen extends StatefulWidget {
  const AddPaymentMethodScreen({super.key});

  @override
  State<AddPaymentMethodScreen> createState() => _AddPaymentMethodScreenState();
}

class _AddPaymentMethodScreenState extends State<AddPaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 67.sp),
              walletMethod(),
              SizedBox(height: 12.sp),
              cardMethod(),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 105.sp),
                  child: SizedBox(
                    height: 46.sp,
                    width: 342.sp,
                    child: FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.sp))),
                      child: Text(
                        "Proceed to pay",
                        style: MyTextStyles.subtitleBold16
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget walletMethod() {
    return Container(
      height: 84.sp,
      width: 341.sp,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 2.sp),
          Radio(
            value: true,
            groupValue: true,
            onChanged: (value) {},
          ),
          SizedBox(width: 4.sp),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pay with wallet",
                style: MyTextStyles.bodyRegular16
                    .copyWith(color: MyColors.textLight),
              ),
              Text(
                "complete the payment using your e wallet",
                style: MyTextStyles.bodyRegular12
                    .copyWith(color: MyColors.grayDark),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget cardMethod() {
    return Container(
      height: 84.sp,
      width: 341.sp,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 2.sp),
          Radio(
            value: true,
            groupValue: true,
            onChanged: (value) {},
          ),
          SizedBox(width: 4.sp),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Credit / debit card",
                style: MyTextStyles.bodyRegular16
                    .copyWith(color: MyColors.textLight),
              ),
              Text(
                "complete the payment using your debit card",
                style: MyTextStyles.bodyRegular12
                    .copyWith(color: MyColors.grayDark),
              ),
            ],
          )
        ],
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
        "Add Payment method",
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
                  builder: (context) => HomeScreen(startPage: 3)));
        },
      ),
    );
  }
}
