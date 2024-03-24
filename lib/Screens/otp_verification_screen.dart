import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmp4/main.dart';
import 'package:fmp4/screens/new_password_screen.dart';
import 'package:fmp4/theme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key, required this.emailForOTP});

  final String emailForOTP;

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final _otpController = TextEditingController();

  bool _isButtonEnabled = false;
  // bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();

    _otpController.dispose();
  }

  void _checkButton(String string) {
    if (_otpController.text.length == 6) {
      setState(() {
        _isButtonEnabled = true;
      });
    } else if (_isButtonEnabled) {
      setState(() {
        _isButtonEnabled = false;
      });
    }
  }

  void _verifyOTP() async {
    try {
      setState(() {
        _isButtonEnabled = false;
      });
      await supabase.auth.verifyOTP(
          token: _otpController.text,
          email: widget.emailForOTP,
          type: OtpType.email);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => NewPasswordScreen()));
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 155.sp),
                Text(
                  "OTP Verification",
                  style: MyTextStyles.headingMedium24
                      .copyWith(color: MyColors.textLight),
                ),
                SizedBox(height: 8.sp),
                Text(
                  "Enter the 6 digit numbers sent to your email",
                  style: MyTextStyles.bodyMedium14
                      .copyWith(color: MyColors.grayDark),
                ),
                //
                //
                SizedBox(height: 50.sp),
                //
                //
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  cursorColor: MyColors.primary,
                  onChanged: _checkButton,
                  controller: _otpController,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(0),
                    fieldHeight: 32.sp,
                    fieldWidth: 32.sp,
                    activeColor: MyColors.primary,
                    selectedColor: MyColors.primary,
                    inactiveColor: MyColors.grayDark,
                  ),
                ),
                //
                //
                SizedBox(height: 30.sp),
                //
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "If you didn’t receive code, ",
                      style: MyTextStyles.bodyRegular14.copyWith(
                        color: MyColors.grayDark,
                      ),
                    ),
                    Text(
                      "resend after 1:00",
                      style: MyTextStyles.bodyRegular14.copyWith(
                        color: MyColors.grayDark,
                      ),
                    ),
                  ],
                ),
                //
                //
                SizedBox(height: 80.sp),
                //
                //
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 46.sp,
                  child: FilledButton(
                      onPressed: _isButtonEnabled ? _verifyOTP : null,
                      style: FilledButton.styleFrom(
                        disabledBackgroundColor: MyColors.grayDark,
                        backgroundColor: MyColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text(
                        "Set New Password",
                        style: MyTextStyles.subtitleBold16
                            .copyWith(color: Colors.white),
                      )),
                ),
                SizedBox(height: 20.sp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
