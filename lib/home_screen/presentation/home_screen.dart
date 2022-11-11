import 'package:flutter/material.dart';
import 'package:waste_manage_sys/dialogs/exit_dialog.dart';
import 'package:waste_manage_sys/clothes_management_sys/presentation/cloth_screen.dart';
import 'package:waste_manage_sys/food_management_sys/presentation/food_screen.dart';

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
            backgroundColor: Colors.grey[100],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black87,
            unselectedItemColor: Colors.grey.withOpacity(0.9),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                label: "Food",
                icon: Icon(Icons.food_bank_rounded),
              ),
              BottomNavigationBarItem(
                label: "Cloth",
                icon: Icon(Icons.abc),
              ),
            ],
            onTap: (index) => _onTap(index),
          ),
        ),
      ),
    );
  }
}
