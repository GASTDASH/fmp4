import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmp4/theme.dart';

class TextBox extends StatefulWidget {
  const TextBox(
      {super.key,
      required this.titleText,
      required this.hintText,
      this.eye = false});

  final String titleText;
  final String hintText;
  final bool eye;

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  bool _showPassword = true;

  @override
  void initState() {
    super.initState();

    _showPassword = !widget.eye;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.titleText,
            style: MyTextStyles.bodyMedium14.copyWith(
              color: MyColors.grayDark,
            ),
          ),
          SizedBox(height: 8.sp),
          TextFormField(
            obscureText: !_showPassword,
            decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: MyTextStyles.bodyMedium14
                    .copyWith(color: MyColors.grayLight),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: MyColors.grayDark),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: MyColors.grayDark),
                ),
                suffixIcon: widget.eye
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                        icon: SvgPicture.asset(!_showPassword
                            ? "assets/icons/linear/eye-slash.svg"
                            : "assets/icons/linear/eye.svg"),
                      )
                    : null),
          ),
        ],
      ),
    );
  }
}
