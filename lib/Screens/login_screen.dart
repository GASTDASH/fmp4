import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fmp4/Screens/home_screen.dart';
import 'package:fmp4/Screens/reg_screen.dart';
import 'package:fmp4/main.dart';
import 'package:fmp4/screens/forgot_password_screen.dart';
import 'package:fmp4/theme.dart';
import 'package:fmp4/Widgets/text_box.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isButtonEnabled = false;

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
  }

  void _checkButton(String string) {
    if (_emailController.text.length > 0 &&
        _passwordController.text.length > 0) {
      setState(() {
        _isButtonEnabled = true;
      });
    } else if (_isButtonEnabled) {
      setState(() {
        _isButtonEnabled = false;
      });
    }
  }

  void _singIn() async {
    try {
      setState(() {
        _isButtonEnabled = false;
      });
      await supabase.auth.signInWithPassword(
          password: _passwordController.text, email: _emailController.text);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
                titleText: 'Email Address',
                hintText: '***********@mail.com',
                controller: _emailController,
                onChanged: _checkButton,
              ),
              TextBox(
                titleText: 'Password',
                hintText: '**********',
                controller: _passwordController,
                eye: true,
                onChanged: _checkButton,
              ),
              //
              //
              SizedBox(height: 5.sp),
              //
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        side: BorderSide(color: MyColors.grayDark),
                        onChanged: (value) {},
                      ),
                      Text(
                        "Remember password",
                        style: MyTextStyles.bodyMedium12
                            .copyWith(color: MyColors.grayDark),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen()));
                    },
                    child: Text(
                      "Forgot Password?",
                      style: MyTextStyles.bodyMedium12.copyWith(
                        color: MyColors.primary,
                      ),
                    ),
                  ),
                ],
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
                    onPressed: _isButtonEnabled ? _singIn : null,
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
              SizedBox(height: 20.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: MyTextStyles.bodyRegular14.copyWith(
                      color: MyColors.grayDark,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegScreen()));
                      },
                      child: Text(
                        "Sign Up",
                        style: MyTextStyles.bodyMedium14.copyWith(
                          color: MyColors.primary,
                        ),
                      ))
                ],
              ),
              SizedBox(height: 18.sp),
              Center(
                child: Text(
                  "or log in using",
                  style: MyTextStyles.bodyRegular14.copyWith(
                    color: MyColors.grayDark,
                  ),
                ),
              ),
              SizedBox(height: 8.sp),
              Center(
                child: SvgPicture.asset(
                  "assets/icons/google.svg",
                  height: 16.sp,
                  width: 16.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
