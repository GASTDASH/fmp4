import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmp4/screens/home_screen.dart';
import 'package:fmp4/theme.dart';
import 'package:fmp4/widgets/text_box.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  bool _isButtonEnabled = false;

  @override
  void dispose() {
    super.dispose();

    _passwordController.dispose();
    _passwordConfirmController.dispose();
  }

  void _checkButton(String string) {
    if (_passwordController.text.length > 0 &&
        _passwordConfirmController.text.length > 0) {
      setState(() {
        _isButtonEnabled = true;
      });
    } else if (_isButtonEnabled) {
      setState(() {
        _isButtonEnabled = false;
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
                  "Welcome Back",
                  style: MyTextStyles.headingMedium24
                      .copyWith(color: MyColors.textLight),
                ),
                SizedBox(height: 8.sp),
                Text(
                  "Fill in your email and password to continue",
                  style: MyTextStyles.bodyMedium14
                      .copyWith(color: MyColors.grayDark),
                ),
                //
                //
                SizedBox(height: 8.sp),
                //
                //
                TextBox(
                  titleText: 'Password',
                  hintText: '***********@mail.com',
                  controller: _passwordController,
                  eye: true,
                  onChanged: _checkButton,
                ),
                TextBox(
                  titleText: 'Confirm Password',
                  hintText: '**********',
                  controller: _passwordConfirmController,
                  eye: true,
                  onChanged: _checkButton,
                ),
                //
                //
                SizedBox(height: 50.sp),
                //
                //
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 46.sp,
                  child: FilledButton(
                      onPressed: _isButtonEnabled
                          ? () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            }
                          : null,
                      style: FilledButton.styleFrom(
                        disabledBackgroundColor: MyColors.grayDark,
                        backgroundColor: MyColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text(
                        "Log in",
                        style: MyTextStyles.subtitleBold16
                            .copyWith(color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
