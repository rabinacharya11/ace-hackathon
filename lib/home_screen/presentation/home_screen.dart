import 'package:flutter/material.dart';
import 'package:waste_manage_sys/dialogs/exit_dialog.dart';

import 'package:waste_manage_sys/food_management_sys/presentation/food_screen.dart';
import 'package:waste_manage_sys/theme/theme_data.dart';

import '../../clothes_management_sys/presentation/cloth_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void _onTap(int index) {
    if (mounted) {
      setState(() {
        _selectedIndex = index;
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () => showExitPopup(context),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox.expand(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                if (mounted) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }
              },
              children: const [
                FoodScreen(),
                ClothScreen(),
              ],
            ),
          ),

          // BottomNavBar
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // backgroundColor: Colors.black.withOpacity(0.2),
            currentIndex: _selectedIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedIconTheme: IconThemeData(color: kPrimaryColor),
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            
            selectedItemColor: kPrimaryColor,
            unselectedItemColor: Colors.black,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                label: "Food",
                icon: Image.asset(
                  'assets/images/food.png',
                  height: 32,
                  width: 32,
                ),
              ),
              BottomNavigationBarItem(
                label: "Cloth",
                icon: Image.asset(
                  'assets/images/cloth.png',
                  height: 32,
                  width: 32,
                ),
              ),
            ],
            onTap: (index) => _onTap(index),
          ),
        ),
      ),
    );
  }
}
