import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmp4/models/track_page.dart';
import 'package:fmp4/screens/pages/home_page.dart';
import 'package:fmp4/screens/pages/profile_page.dart';
import 'package:fmp4/screens/pages/wallet_page.dart';
import 'package:fmp4/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.startPage = 0});

  final int startPage;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _currentPage = widget.startPage;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: bottomNav(),
        body: _pages.elementAt(_currentPage),
      ),
    );
  }

  Widget bottomNav() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedPadding(
          duration: Durations.short2,
          padding: EdgeInsets.only(
              left: _currentPage == 0
                  ? 30.sp
                  : _currentPage == 1
                      ? 127.sp
                      : _currentPage == 2
                          ? 225.sp
                          : 325.sp),
          child: Container(
            height: 3.sp,
            width: 35.sp,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.black, blurRadius: 2, spreadRadius: 0)
                ],
                color: MyColors.primary,
                borderRadius: BorderRadius.circular(20.sp)),
          ),
        ),
        BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _currentPage = value;
            });
          },
          currentIndex: _currentPage,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(
            color: MyColors.grayDark,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          unselectedItemColor: MyColors.grayDark,
          selectedLabelStyle: TextStyle(
            color: MyColors.primary,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          selectedItemColor: MyColors.primary,
          items: [
            BottomNavigationBarItem(
                icon: _currentPage == 0
                    ? SvgPicture.asset(
                        "assets/icons/filled/house-2.svg",
                        height: 24.sp,
                      )
                    : SvgPicture.asset(
                        "assets/icons/linear/house-2.svg",
                        height: 24.sp,
                        color: MyColors.grayDark,
                      ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: _currentPage == 1
                    ? SvgPicture.asset(
                        "assets/icons/filled/wallet-3.svg",
                        height: 24.sp,
                      )
                    : SvgPicture.asset(
                        "assets/icons/linear/wallet-3.svg",
                        height: 24.sp,
                        color: MyColors.grayDark,
                      ),
                label: "Wallet"),
            BottomNavigationBarItem(
                icon: _currentPage == 2
                    ? SvgPicture.asset(
                        "assets/icons/filled/smart-car.svg",
                        height: 24.sp,
                      )
                    : SvgPicture.asset(
                        "assets/icons/linear/smart-car.svg",
                        height: 24.sp,
                        color: MyColors.grayDark,
                      ),
                label: "Track"),
            BottomNavigationBarItem(
                icon: _currentPage == 3
                    ? SvgPicture.asset(
                        "assets/icons/filled/profile-circle.svg",
                        height: 24.sp,
                      )
                    : SvgPicture.asset(
                        "assets/icons/linear/profile-circle.svg",
                        height: 24.sp,
                        color: MyColors.grayDark,
                      ),
                label: "Profile"),
          ],
        ),
      ],
    );
  }
}

List<Widget> _pages = <Widget>[
  HomePage(),
  WalletPage(),
  TrackPage(),
  ProfilePage(),
];
