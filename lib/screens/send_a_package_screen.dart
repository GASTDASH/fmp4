import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fmp4/screens/home_screen.dart';
import 'package:fmp4/screens/send_a_package_receipt_screen.dart';
import 'package:fmp4/theme.dart';
import 'package:fmp4/widgets/appbar.dart';
import 'package:fmp4/widgets/destination_details.dart';

class SendAPackageScreen extends StatefulWidget {
  const SendAPackageScreen({super.key});

  @override
  State<SendAPackageScreen> createState() => _SendAPackageScreenState();
}

List<List<TextEditingController>> destinationDetailsWidgetsList_Controllers = [
  [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ],
];

class _SendAPackageScreenState extends State<SendAPackageScreen> {
  List<Widget> destinationDetailsWidgetsList = [];

  @override
  void initState() {
    super.initState();

    destinationDetailsWidgetsList.clear();
    destinationDetailsWidgetsList = <Widget>[
      DestinationDetails(
        controllers: destinationDetailsWidgetsList_Controllers[0],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: my_appbar(
            title: "Send a package",
            backButton: true,
            onPressedBack: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(startPage: 0)));
            }),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.sp),
            child: Column(
              children: [
                SizedBox(height: 10.sp),
                originDeatils(),
                destinationDetails(),
                addDestinationButton(),
                packageDetails(),
                SizedBox(height: 39.sp),
                selectDeliveryType(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addDestinationButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          destinationDetailsWidgetsList.add(DestinationDetails(
            controllers: destinationDetailsWidgetsList_Controllers[
                destinationDetailsWidgetsList_Controllers.length - 1],
          ));
        });
      },
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/linear/add-square.svg",
            height: 14.sp,
            width: 14.sp,
            color: MyColors.primary,
          ),
          SizedBox(width: 6.sp),
          Text(
            "Add destination",
            style:
                MyTextStyles.bodyRegular12.copyWith(color: MyColors.grayDark),
          )
        ],
      ),
    );
  }

  Column selectDeliveryType() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Select deliver type",
              style: MyTextStyles.bodyMedium14.copyWith(
                color: MyColors.textLight,
              ),
            )
          ],
        ),
        SizedBox(height: 16.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            instantDeliveryButton(),
            scheduledDeliveryButton(),
          ],
        ),
      ],
    );
  }

  instantDeliveryButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => SendAPackageReceiptScreen()));
      },
      child: Container(
        height: 75.sp,
        width: 159.sp,
        decoration: BoxDecoration(
          color: MyColors.primary,
          borderRadius: BorderRadius.circular(8.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/linear/clock.svg",
              color: Colors.white,
              height: 24.sp,
              width: 24.sp,
            ),
            SizedBox(height: 7.sp),
            Text(
              "Instant delivery",
              style: MyTextStyles.bodyMedium14.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  scheduledDeliveryButton() {
    return GestureDetector(
      child: Container(
        height: 75.sp,
        width: 159.sp,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/linear/calendar.svg",
              color: MyColors.grayDark,
              height: 24.sp,
              width: 24.sp,
            ),
            SizedBox(height: 7.sp),
            Text(
              "Scheduled delivery",
              style: MyTextStyles.bodyMedium14.copyWith(
                color: MyColors.grayDark,
              ),
            ),
          ],
        ),
      ),
    );
  }

  originDeatils() {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              "assets/icons/linear/cross.svg",
              height: 16.sp,
            ),
            SizedBox(width: 8.sp),
            Text(
              "Origin Details",
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
      ],
    );
  }

  Widget destinationDetails() {
    return Column(
      children: destinationDetailsWidgetsList,
    );
  }

  packageDetails() {
    return Column(
      children: [
        SizedBox(height: 13.sp),
        Row(
          children: [
            Text(
              "Package Details",
              style: MyTextStyles.bodyMedium14.copyWith(
                color: MyColors.textLight,
              ),
            )
          ],
        ),
        SizedBox(height: 5.sp),
        textFieldDetail(hintText: "package items"),
        textFieldDetail(hintText: "Weight of item(kg)"),
        textFieldDetail(hintText: "Worth of Items"),
      ],
    );
  }
}

textFieldDetail({String hintText = ""}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 2.5),
    child: Container(
      height: 32.sp,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 2,
            spreadRadius: 0,
            offset: Offset(0, 2),
          ),
        ],
        color: Colors.white,
      ),
      child: TextField(
        style: MyTextStyles.bodyRegular12.copyWith(color: MyColors.textLight),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 8.sp),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          hintText: hintText,
          hintStyle:
              MyTextStyles.bodyRegular12.copyWith(color: MyColors.grayLight),
        ),
      ),
    ),
  );
}
