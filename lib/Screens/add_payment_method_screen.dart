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
