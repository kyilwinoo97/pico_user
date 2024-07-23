import 'package:flutter/material.dart';
import 'package:pico_user/presentation/configs/configs.dart';
import 'package:pico_user/presentation/home/home_page.dart';
import 'package:pico_user/presentation/shopping_cart/shopping_cart_page.dart';
import 'package:badges/badges.dart' as badges;

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({super.key});

  @override
  State<StatefulWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  int navbarIndex = 0;

  final navItem = [
    BottomNavigationBarItem(
        backgroundColor: kSecondary,
        icon: Icon(Icons.home_outlined),
        activeIcon: Icon(Icons.home),
        label: "Home"),
    BottomNavigationBarItem(
        backgroundColor: kSecondary,
        icon: Icon(Icons.favorite_border),
        activeIcon: Icon(Icons.favorite),
        label: "Favorite"),
    BottomNavigationBarItem(
        backgroundColor: kSecondary,
        icon: badges.Badge(
            position: badges.BadgePosition.topEnd(),
            showBadge: true,
            badgeStyle: const badges.BadgeStyle(
                padding: EdgeInsets.all(5), badgeColor: Colors.green),
            badgeContent: const Text(
              '2',
              style: TextStyle(color: Colors.white, fontSize: 8.0),
            ),
            child: const Icon(
              Icons.messenger_outline,
            )),
        activeIcon: badges.Badge(
            position: badges.BadgePosition.topEnd(),
            showBadge: true,
            badgeStyle: const badges.BadgeStyle(
                padding: EdgeInsets.all(5), badgeColor: Colors.green),
            badgeContent: const Text(
              '2',
              style: TextStyle(color: Colors.white, fontSize: 8.0),
            ),
            child: const Icon(
              Icons.messenger,
            )),
        label: "Inbox"),
    BottomNavigationBarItem(
        backgroundColor: kSecondary,
        icon: const Icon(Icons.account_circle_outlined),
        activeIcon: Icon(Icons.account_circle),
        label: "Profile"),
  ];
  var pages = [
    const HomePage(),
    const ShoppingCartPage(),
    const HomePage(),
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navbarIndex,
        type: BottomNavigationBarType.shifting,
        backgroundColor: kSecondary,
        selectedItemColor: kBlack,
        selectedFontSize: 12,
        unselectedItemColor: kGrey500,
        items: navItem,
        onTap: (index) {
          _setSelectedItemIndex(index);
        },
      ),
      body: pages[navbarIndex],
    );
  }

  void _setSelectedItemIndex(int index) {
    setState(() {
      navbarIndex = index;
    });
  }
}
