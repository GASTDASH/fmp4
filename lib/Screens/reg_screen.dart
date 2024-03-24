import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmp4/main.dart';
import 'package:fmp4/screens/login_screen.dart';
import 'package:fmp4/screens/privacy_screen.dart';
import 'package:fmp4/theme.dart';
import 'package:fmp4/Widgets/text_box.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({super.key});

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  final _fullnameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  bool _privacyChecked = false;

  bool _isButtonEnabled = false;

  @override
  void dispose() {
    super.dispose();

    _fullnameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
  }

  void _checkButton(String string) {
    if (_emailController.text.length > 0 &&
        _fullnameController.text.length > 0 &&
        _phoneController.text.length > 0 &&
        _passwordController.text.length > 0 &&
        _passwordConfirmController.text.length > 0 &&
        _privacyChecked) {
      setState(() {
        _isButtonEnabled = true;
      });
    } else if (_isButtonEnabled) {
      setState(() {
        _isButtonEnabled = false;
      });
    }
  }

  void _singUp() async {
    try {
      setState(() {
        _isButtonEnabled = false;
      });
      await supabase.auth.signUp(
          password: _passwordController.text, email: _emailController.text);
      print("================ Registration successful");
      await supabase.auth.signInWithPassword(
        password: _passwordController.text,
        email: _emailController.text,
      );
      String _id = supabase.auth.currentSession!.user.id;
      await supabase.auth.signOut();
      await supabase
          .from("profiles")
          .insert({"name": _fullnameController.text, "id": _id});
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
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
                SizedBox(height: 24.sp),
                Text(
                  "Create an account",
                  style: MyTextStyles.headingMedium24
                      .copyWith(color: MyColors.textLight),
                ),
                SizedBox(height: 8.sp),
                Text(
                  "Complete the sign up process to get started",
                  style: MyTextStyles.bodyMedium14
                      .copyWith(color: MyColors.grayDark),
                ),
                //
                //
                SizedBox(height: 21.sp),
                //
                //
                TextBox(
                  titleText: 'Full name',
                  hintText: 'Ivanov Ivan',
                  controller: _fullnameController,
                  onChanged: _checkButton,
                ),
                TextBox(
                  titleText: 'Phone Number',
                  hintText: '+7(999)999-99-99',
                  controller: _phoneController,
                  onChanged: _checkButton,
                ),
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
                TextBox(
                  titleText: 'Confirm Password',
                  hintText: '**********',
                  controller: _passwordConfirmController,
                  eye: true,
                  onChanged: _checkButton,
                ),
                //
                //
                SizedBox(height: 25.sp),
                //
                //
                Row(
                  children: [
                    Checkbox(
                        side: BorderSide(color: MyColors.primary),
                        value: _privacyChecked,
                        onChanged: (value) {
                          setState(() {
                            _privacyChecked = !_privacyChecked;
                          });
                          _checkButton("");
                        }),
                    SizedBox(width: 11.sp),
                    SizedBox(
                      width: 271.sp,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PrivacyScreen()));
                        },
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: "By ticking this box, you agree to our ",
                                style: MyTextStyles.bodyRegular12
                                    .copyWith(color: MyColors.grayDark),
                                children: [
                                  TextSpan(
                                    text:
                                        "Terms and conditions and private policy",
                                    style: MyTextStyles.bodyRegular12
                                        .copyWith(color: MyColors.warning),
                                  )
                                ])),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.sp),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 46.sp,
                  child: FilledButton(
                      onPressed: _isButtonEnabled ? _singUp : null,
                      style: FilledButton.styleFrom(
                        disabledBackgroundColor: MyColors.grayDark,
                        backgroundColor: MyColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text(
                        "Sign Up",
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
                SizedBox(height: 18.sp),
                Center(
                  child: Text(
                    "or sign in using",
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
      ),
    );
  }
}
