import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmp4/main.dart';
import 'package:fmp4/screens/login_screen.dart';
import 'package:fmp4/screens/otp_verification_screen.dart';
import 'package:fmp4/theme.dart';
import 'package:fmp4/widgets/text_box.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  bool _isButtonEnabled = false;

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
  }

  void _checkButton(String string) {
    if (_emailController.text.length > 0) {
      setState(() {
        _isButtonEnabled = true;
      });
    } else if (_isButtonEnabled) {
      setState(() {
        _isButtonEnabled = false;
      });
    }
  }

  void _sendOTP() async {
    try {
      setState(() {
        _isButtonEnabled = false;
      });
      await supabase.auth.signInWithOtp(
        email: _emailController.text,
        shouldCreateUser: false,
      );
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => OTPVerificationScreen(
                    emailForOTP: _emailController.text,
                  )));
    } catch (e) {
      print(e.toString());
    } finally {
      setState(() {
        _isButtonEnabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 155.sp),
              Text(
                "Forgot Password",
                style: MyTextStyles.headingMedium24
                    .copyWith(color: MyColors.textLight),
              ),
              SizedBox(height: 8.sp),
              Text(
                "Enter your email address",
                style: MyTextStyles.bodyMedium14
                    .copyWith(color: MyColors.grayDark),
              ),
              //
              //
              SizedBox(height: 8.sp),
              //
              //
              TextBox(
                titleText: 'Email Address',
                hintText: '***********@mail.com',
                controller: _emailController,
                onChanged: _checkButton,
              ),
              //
              //
              SizedBox(height: 5.sp),
              //
              //
              SizedBox(height: 50.sp),
              //
              //
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 46.sp,
                child: FilledButton(
                    onPressed: _isButtonEnabled ? _sendOTP : null,
                    style: FilledButton.styleFrom(
                      disabledBackgroundColor: MyColors.grayDark,
                      backgroundColor: MyColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text(
                      "Send OTP",
                      style: MyTextStyles.subtitleBold16
                          .copyWith(color: Colors.white),
                    )),
              ),
              SizedBox(height: 20.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Remember password? Back to",
                    style: MyTextStyles.bodyRegular14.copyWith(
                      color: MyColors.grayDark,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        "Sign in",
                        style: MyTextStyles.bodyMedium14.copyWith(
                          color: MyColors.primary,
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
