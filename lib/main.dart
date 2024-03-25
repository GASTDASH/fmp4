import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmp4/models/profile.dart';
import 'package:fmp4/models/queue_item.dart';
import 'package:fmp4/screens/onboarding_screen.dart';
import 'package:fmp4/screens/reg_screen.dart';
import 'package:fmp4/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // Initializing Supabase Data Base
  try {
    await Supabase.initialize(
        url: "https://lksuizayrfwpsmxackyy.supabase.co",
        anonKey:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxrc3VpemF5cmZ3cHNteGFja3l5Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcwODg1NDY5OSwiZXhwIjoyMDI0NDMwNjk5fQ.4QcpaeZ8y5Hhy3szy519Z7rbLfZuE-rMzH2h7KnU8GA");
  } catch (e) {
    // If error
  }

  // For no bug with Texts
  await ScreenUtil.ensureScreenSize();

  // Init preferences
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // Working with Onboarding queue
  List<String>? _itemsJson = prefs.getStringList("items");

  // If queue have no items (first run)
  if (_itemsJson == null) {
    print("================ Первый запуск! Создание очереди...");
    queue.add(Item(
      "assets/onboarding/onboard1.svg",
      "Quick Delivery At Your Doorstep",
      "Enjoy quick pick-up and delivery to your destination",
    ));
    queue.add(Item(
      "assets/onboarding/onboard2.svg",
      "Flexible Payment",
      "Different modes of payment either before and after delivery without stress",
    ));
    queue.add(Item(
      "assets/onboarding/onboard3.svg",
      "Real-time Tracking",
      "Track your packages/items from the comfort of your home till final destination",
    ));

    List<String> itemsJson = <String>[];
    for (var item in queue) {
      itemsJson.add(jsonEncode(item.toJson()));
    }
    prefs.setStringList("items", itemsJson);

    runApp(const MyApp(home: OnBoardingScreen()));
  }
  // If queue end
  else if (_itemsJson.isEmpty) {
    runApp(const MyApp(home: RegScreen()));
  }
  // If queue have items
  else {
    for (String _itemJson in _itemsJson) {
      queue.add(Item.fromJson(jsonDecode(_itemJson)));
    }
    runApp(const MyApp(home: OnBoardingScreen()));
  }
}

Queue<Item> queue = Queue();

final supabase = Supabase.instance.client;

bool showBalance = true;
bool darkMode = false;

Profile myProfile = Profile();

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.home});

  final Widget home;

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
        home: this.home,
      ),
    );
  }
}

class QueueManager {
  final String key = "queue";

  Future<void> setQueue(queue) async {
    String queueJson = jsonEncode(queue.toJson());

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, queueJson);
  }

  Future<Queue> getQueue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String queueJson = prefs.getString(key)!;

    Queue queue = jsonDecode(queueJson);
    return queue;
  }
}
