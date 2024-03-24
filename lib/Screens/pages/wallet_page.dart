import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fmp4/theme.dart';
import 'package:fmp4/widgets/appbar.dart';
import 'package:fmp4/widgets/profile_info.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: my_appbar(
          backButton: false,
          title: "Wallet",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 41.sp),
                ProfileInfo(),
                SizedBox(height: 28.sp),
                topUp(),
                SizedBox(height: 41.sp),
                Text(
                  "Transaction History",
                  style: MyTextStyles.headingMedium20
                      .copyWith(color: MyColors.textLight),
                ),
                SizedBox(height: 24.sp),
                transactionBox(),
                transactionBox(),
                transactionBox(),
                transactionBox(),
                transactionBox(),
                transactionBox(),
                transactionBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget transactionBox() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.sp),
      child: Container(
        height: 44.sp,
        width: 342.sp,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Colors.black.withOpacity(.15),
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "-N3,000.00",
                    style: TextStyle(
                      color: MyColors.error,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Delivery fee",
                    style: TextStyle(
                      color: MyColors.textLight,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text(
                "July 7, 2022",
                style: MyTextStyles.bodyRegular12
                    .copyWith(color: MyColors.grayDark),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget topUp() {
    return Container(
      height: 116.sp,
      width: 341.sp,
      decoration: BoxDecoration(
        color: MyColors.grayLight,
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Top Up",
            style:
                MyTextStyles.subtitleBold16.copyWith(color: MyColors.textLight),
          ),
          SizedBox(height: 12.sp),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 48.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                actionButton(
                  iconAsset: "assets/icons/linear/bank.svg",
                  text: "Bank",
                ),
                actionButton(
                  iconAsset: "assets/icons/linear/transfer.svg",
                  text: "Transfer",
                ),
                actionButton(
                  iconAsset: "assets/icons/linear/card2.svg",
                  text: "Card",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget actionButton({required String iconAsset, required String text}) {
    return Column(
      children: [
        SizedBox(
          height: 48.sp,
          width: 48.sp,
          child: IconButton.filled(
            onPressed: () {},
            icon: SvgPicture.asset(iconAsset),
          ),
        ),
        SizedBox(height: 4.sp),
        Text(
          text,
          style: MyTextStyles.bodyRegular12.copyWith(color: MyColors.textLight),
        ),
      ],
    );
  }
}
