import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmp4/models/onboarding_item.dart';
import 'package:fmp4/screens/home_screen.dart';
import 'package:fmp4/screens/reg_screen.dart';
import 'package:fmp4/screens/send_a_package_screen.dart';
import 'package:fmp4/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
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

  try {
    await Supabase.initialize(
        url: "https://lksuizayrfwpsmxackyy.supabase.co",
        anonKey:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxrc3VpemF5cmZ3cHNteGFja3l5Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcwODg1NDY5OSwiZXhwIjoyMDI0NDMwNjk5fQ.4QcpaeZ8y5Hhy3szy519Z7rbLfZuE-rMzH2h7KnU8GA");
  } catch (e) {
  } finally {}

  runApp(const MyApp());
}

Queue<Item> queue = Queue();

final supabase = Supabase.instance.client;

bool showBalance = true;
bool darkMode = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GASTDASH Delivery',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: MyColors.primary, background: Colors.white),
          useMaterial3: true,
        ),
        home: SendAPackageScreen(),
      ),
    );
  }
}
