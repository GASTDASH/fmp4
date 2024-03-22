import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmp4/Onboarding/onboarding_item.dart';
import 'package:fmp4/Screens/onboarding_screen.dart';

void main() {
  queue.add(Item(
      SvgPicture.asset("assets/onboarding/onboard1.svg"),
      "Quick Delivery At Your Doorstep",
      "Enjoy quick pick-up and delivery to your destination"));
  queue.add(Item(
      SvgPicture.asset("assets/onboarding/onboard2.svg"),
      "Flexible Payment",
      "Different modes of payment either before and after delivery without stress"));
  queue.add(Item(
      SvgPicture.asset("assets/onboarding/onboard3.svg"),
      "Real-time Tracking",
      "Track your packages/items from the comfort of your home till final destination"));

  runApp(const MyApp());
}

Queue<Item> queue = Queue();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      child: MaterialApp(
        title: 'GASTDASH Delivery',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: OnBoardingScreen(),
      ),
    );
  }
}
