import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lascade_task/core/helpers/colors.dart';
import 'package:lascade_task/screens/home_screen/home_screen.dart';
import 'package:lascade_task/screens/notifications_screen/notifications_screen.dart';
import 'package:lascade_task/screens/profile_screen/profile_screen.dart';
import 'package:lascade_task/screens/search_screen/search_screen.dart';

import '../../core/consts/icons_consts.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _bottomIndex = 0;

  final pages = [
    const HomeScreen(),
    const SearchScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
  ];

  final icons = [
    IconsConsts.homeInactive,
    IconsConsts.searchInactive,
    IconsConsts.notifications,
    IconsConsts.profileInactive,
  ];

  final activeIcons = [
    IconsConsts.homeActive,
    IconsConsts.searchActive,
    IconsConsts.notifications,
    IconsConsts.profileActive,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: IndexedStack(
        index: _bottomIndex,
        children: pages,
      ),
      bottomNavigationBar:AnimatedBottomNavigationBar.builder(
  height: 50,
  leftCornerRadius: 20,
  rightCornerRadius: 20,
  elevation: 5,
  backgroundColor: ColorsConst.colorFromHex('#FFFFFF'),
  itemCount: icons.length,
  tabBuilder: (index, isActive) => Center(
    child: SvgPicture.asset(
      isActive ? activeIcons[index] : icons[index],
      width: 24,
      height: 24,
      fit: BoxFit.none,
    ),
  ),
  activeIndex: _bottomIndex,
  gapLocation: GapLocation.center,
  notchSmoothness: NotchSmoothness.defaultEdge,
  onTap: (index) => setState(() => _bottomIndex = index),
),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        onPressed: () {},
        child: SvgPicture.asset(IconsConsts.hatIcon, width: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
