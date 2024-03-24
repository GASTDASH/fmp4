import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmp4/theme.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key, required this.loadingText});

  final String loadingText;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.loadingText,
              style: MyTextStyles.headingBold24,
            ),
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
