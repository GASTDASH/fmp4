import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmp4/main.dart';
import 'package:fmp4/models/queue.dart';
import 'package:fmp4/screens/reg_screen.dart';
import 'package:fmp4/theme.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  OBQueue obQueue = OBQueue();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40.sp),
              SizedBox(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                child: SvgPicture.asset(obQueue.getImage()),
              ),
              SizedBox(height: 20.sp),
              SizedBox(
                width: 287.sp,
                child: Text(
                  obQueue.getTitle(),
                  textAlign: TextAlign.center,
                  style: MyTextStyles.headingBold24.copyWith(
                    color: MyColors.primary,
                  ),
                ),
              ),
              SizedBox(height: 10.sp),
              SizedBox(
                width: 311.sp,
                child: Text(
                  obQueue.getSubtitle()!,
                  textAlign: TextAlign.center,
                  style: MyTextStyles.bodyRegular16.copyWith(
                    color: MyColors.textLight,
                  ),
                ),
              ),
              SizedBox(height: 30.sp),
              obQueue.isLast()
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.sp),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 46.sp,
                            child: FilledButton(
                              onPressed: () {
                                obQueue.skip();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegScreen()));
                              },
                              child: Text(
                                "Sign Up",
                                style: MyTextStyles.subtitleBold16.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              style: FilledButton.styleFrom(
                                  backgroundColor: MyColors.primary,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(4.sp))),
                            ),
                          ),
                        )
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 24.sp),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              height: 50.sp,
                              width: 100.sp,
                              child: OutlinedButton(
                                onPressed: () {
                                  obQueue.skip();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RegScreen()));
                                  // print(queue.isEmpty);
                                },
                                child: Text(
                                  "Skip",
                                  style: MyTextStyles.button1
                                      .copyWith(color: MyColors.primary),
                                ),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: MyColors.primary,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.sp),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              height: 50.sp,
                              width: 100.sp,
                              child: FilledButton(
                                onPressed: () {
                                  setState(() {
                                    obQueue.next();
                                  });
                                },
                                child: Text(
                                  "Next",
                                  style: MyTextStyles.button1
                                      .copyWith(color: Colors.white),
                                ),
                                style: FilledButton.styleFrom(
                                  backgroundColor: MyColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.sp),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 24.sp),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class Holder extends StatefulWidget {
  const Holder({super.key});

  @override
  State<Holder> createState() => _HolderState();
}

class _HolderState extends State<Holder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
