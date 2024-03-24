import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fmp4/main.dart';
import 'package:fmp4/screens/add_payment_method_screen.dart';
import 'package:fmp4/screens/login_screen.dart';
import 'package:fmp4/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void _logout() async {
    try {
      await supabase.auth.signOut();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } catch (e) {
    } finally {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp),
          child: Column(
            children: [
              SizedBox(height: 27.sp),
              profileInfo(),
              SizedBox(height: 19.sp),
              darkModeRow(),
              SizedBox(height: 19.sp),
              settingsCard(
                  title: "Edit Profile",
                  subtitle: "Name, phone no, address, email ...",
                  iconAsset: "assets/icons/linear/profile-circle.svg"),
              SizedBox(height: 8.sp),
              settingsCard(
                  title: "Statements & Reports",
                  subtitle: "Download transaction details, orders, deliveries",
                  iconAsset: "assets/icons/linear/document.svg"),
              SizedBox(height: 8.sp),
              settingsCard(
                  title: "Notification Settings",
                  subtitle: "mute, unmute, set location & tracking setting",
                  iconAsset: "assets/icons/linear/notification.svg"),
              SizedBox(height: 8.sp),
              settingsCard(
                title: "Card & Bank account settings",
                subtitle: "change cards, delete card details",
                iconAsset: "assets/icons/linear/wallet-3.svg",
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddPaymentMethodScreen()));
                },
              ),
              SizedBox(height: 8.sp),
              settingsCard(
                  title: "Referrals",
                  subtitle: "check no of friends and earn",
                  iconAsset: "assets/icons/linear/referrals.svg"),
              SizedBox(height: 8.sp),
              settingsCard(
                  title: "About Us",
                  subtitle: "know more about us, terms and conditions",
                  iconAsset: "assets/icons/linear/map.svg"),
              SizedBox(height: 8.sp),
              settingsCard(
                  title: "Log Out",
                  iconAsset: "assets/icons/linear/logout.svg",
                  onTap: _logout),
            ],
          ),
        ),
      ),
    );
  }

  Widget settingsCard(
      {required String title,
      String? subtitle,
      required String iconAsset,
      Function()? onTap}) {
    if (onTap == null) onTap = () {};

    return SizedBox(
      height: subtitle != null ? 62.sp : 50.sp,
      child: Card(
        shadowColor: Colors.black.withOpacity(0.15),
        elevation: 4,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      iconAsset,
                      height: 24.sp,
                    ),
                    SizedBox(width: 6.sp),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: MyTextStyles.subtitleMedium16
                              .copyWith(color: MyColors.textLight),
                        ),
                        subtitle != null
                            ? Text(
                                subtitle,
                                style: MyTextStyles.bodyRegular12
                                    .copyWith(color: MyColors.grayDark),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.chevron_right_outlined),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row darkModeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Enable dark Mode",
          style:
              MyTextStyles.subtitleMedium16.copyWith(color: MyColors.textLight),
        ),
        Switch(
            value: darkMode,
            onChanged: (value) {
              setState(() {
                darkMode = value;
              });
            })
      ],
    );
  }

  Widget profileInfo() {
    return Row(
      children: [
        SizedBox(
          height: 60.sp,
          width: 60.sp,
          child: CircleAvatar(
            backgroundColor: MyColors.grayDark,
            foregroundImage: AssetImage("assets/avatars/ava2.png"),
          ),
        ),
        SizedBox(width: 5.sp),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello {fullname}",
              style: TextStyle(
                  color: MyColors.textLight,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              showBalance
                  ? "Current balance: {balance}"
                  : "Current balance: ******",
              style: MyTextStyles.bodyRegular12
                  .copyWith(color: MyColors.textLight),
            ),
          ],
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                setState(() {
                  showBalance = !showBalance;
                });
              },
              icon: SvgPicture.asset("assets/icons/linear/eye-slash.svg"),
            ),
          ),
        ),
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 4,
      shadowColor: Colors.black45,
      centerTitle: true,
      title: Text(
        "Profile",
        style: MyTextStyles.subtitleMedium16.copyWith(
          color: MyColors.grayDark,
        ),
      ),
    );
  }
}
