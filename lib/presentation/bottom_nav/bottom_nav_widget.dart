import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pico_user/presentation/cart/bloc/cart_bloc.dart';
import 'package:pico_user/presentation/configs/configs.dart';
import 'package:pico_user/presentation/configs/constant_colors.dart';
import 'package:pico_user/presentation/home/home_page.dart';
import 'package:pico_user/presentation/inbox/inbox_page.dart';
import 'package:badges/badges.dart' as badges;

import '../all_item/all_item_page.dart';
import '../route/routes.dart';
import 'nav_bar.dart';
import 'package:pico_user/di/injection_container.dart' as di;

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({super.key});

  @override
  State<StatefulWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  int navbarIndex = 0;

  final navItem = [
    BottomNavigationBarItem(
        backgroundColor: kGrey100,
        icon: Icon(Icons.home_outlined),
        activeIcon: Icon(Icons.home),
        label: "Home"),
    BottomNavigationBarItem(
        backgroundColor: kGrey100,
        icon: Icon(Icons.favorite_border),
        activeIcon: Icon(Icons.favorite),
        label: "Lov"),
    BottomNavigationBarItem(
        backgroundColor: kGrey100,
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
        backgroundColor: kGrey100,
        icon: const Icon(Icons.account_circle_outlined),
        activeIcon: const Icon(Icons.account_circle),
        label: "Profile"),
  ];
  var pages = [
    const HomePage(),
    const AllItemPage(),
    const InboxPage(),
    const HomePage(),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(
        pageIndex: navbarIndex,
        onTap: (index) {
          if (index == navbarIndex) {
            // items[index]
            //     .navKey
            //     .currentState
            //     ?.popUntil((route) => route.isFirst);
          } else {
            setState(() {
              navbarIndex = index;
            });
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.cart,
          );
        },
        child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              var showBadge = false;
              int count = 0;
              if(state is Success){
                showBadge = true;
                for (var value in state.cart.values) {
                  count += value.length;
                }
                return badges.Badge(
                  position: badges.BadgePosition.custom(top: -7, end: -7),
                  showBadge: showBadge,
                  badgeStyle: const badges.BadgeStyle(
                      padding: EdgeInsets.all(7), badgeColor: Colors.white),
                  badgeContent: Text(
                    count.toString(),
                    style: const TextStyle(color: Colors.green, fontSize: 12.0),
                  ),
                  child: FloatingActionButton(
                      onPressed: null,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: 2, color: kPrimary),
                          borderRadius: BorderRadius.circular(30)),
                      child: const Icon(
                        Icons.shopping_cart,
                        color: kWhite,
                      )),
                );
              }
                return FloatingActionButton(
                    onPressed: null,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: kPrimary),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Icon(
                      Icons.shopping_cart,
                      color: kWhite,
                    ));

            }),
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
