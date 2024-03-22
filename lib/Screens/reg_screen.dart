import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  @override
  void dispose() {
    super.dispose();

    _fullnameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
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
              ),
              TextBox(
                titleText: 'Phone Number',
                hintText: '+7(999)999-99-99',
              ),
              TextBox(
                titleText: 'Email Address',
                hintText: '***********@mail.com',
              ),
              TextBox(
                titleText: 'Password',
                hintText: '**********',
                eye: true,
              ),
              TextBox(
                titleText: 'Confirm Password',
                hintText: '**********',
                eye: true,
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
                      }),
                  SizedBox(width: 11.sp),
                  SizedBox(
                    width: 271.sp,
                    child: InkWell(
                      onTap: () {},
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
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
