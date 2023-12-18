import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../model/content_model.dart';
import '../pages/nav_pages/home_page.dart';

class MyNavbar extends StatefulWidget {
  const MyNavbar({super.key});

  @override
  State<MyNavbar> createState() => _MyNavbarState();
}

class _MyNavbarState extends State<MyNavbar> {
  int _currentPageIndex = 0;
  static List<Widget> kPages = [
    const HomeView(),
    const SizedBox(
      child: Center(
        child: Icon(Icons.search_off_outlined),
      ),
    ),
    const SizedBox(
      child: Center(
        child: Icon(Icons.person_off_outlined),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      bottomNavigationBar: GNav(
        style: GnavStyle.google,
        onTabChange: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        gap: 4,
        haptic: false,
        curve: Curves.ease,
        tabBorderRadius: 20,
        selectedIndex: _currentPageIndex,
        tabMargin: const EdgeInsets.all(10),
        backgroundColor: AppColors.kBackground,
        activeColor: AppColors.kSecondary,
        color: AppColors.kSecondary,
        textStyle: GoogleFonts.poppins(),
        tabActiveBorder: Border.all(color: AppColors.kSecondary, width: 2),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.shopping_cart_outlined,
            text: 'Cart',
          ),
          GButton(
            icon: Icons.person_outline_sharp,
            text: 'Profile',
          ),
        ],
      ),
      body: kPages[_currentPageIndex],
    );
  }
}
