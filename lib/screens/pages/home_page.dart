import 'package:flutter/material.dart';
import 'package:fmp4/screens/notification_screen.dart';
import 'package:fmp4/screens/send_a_package_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              FilledButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen()));
                },
                child: Text("Notification"),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SendAPackageScreen()));
                },
                child: Text("Send a package"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
