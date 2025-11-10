import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza/utils/colors.dart';
import 'package:laza/view/pages/home/BottomNavigationBarItem/cart_screen.dart';
import 'package:laza/view/pages/home/BottomNavigationBarItem/home_screen.dart';
import 'package:laza/view/pages/home/BottomNavigationBarItem/wish_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pages = <Widget>[
    const HomeScreen(),
    const WishList(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        selectedItemColor: customColors.primaryColor, // highlight color
        unselectedItemColor: const Color(0xff8F959E),
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: selectedIndex == 0
                  ? customColors.primaryColor
                  : const Color(0xff8F959E),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/love.svg',
              color: selectedIndex == 1
                  ? customColors.primaryColor
                  : const Color(0xff8F959E),
            ),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/cart.svg',
              color: selectedIndex == 2
                  ? customColors.primaryColor
                  : const Color(0xff8F959E),
            ),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
