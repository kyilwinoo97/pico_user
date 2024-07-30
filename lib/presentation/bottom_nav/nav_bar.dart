import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pico_user/presentation/configs/configs.dart';
import 'package:pico_user/presentation/utils/extensions/widget_ex.dart';

class NavBar extends StatelessWidget{
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({required this.pageIndex, required this.onTap,super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: kGrey100,
      height: 55,
      child: Row(
        children: [
          navItem(
            Icons.home_outlined,
            Icons.home,
            pageIndex == 0,
            onTap: () => onTap(0),
          ),
          navItem(
            Icons.favorite_border,
            Icons.favorite,
            pageIndex == 1,
            onTap: () => onTap(1),
          ),
          const SizedBox(width: 80),
          navItem(
            Icons.messenger_outline,
            Icons.messenger,
            pageIndex == 2,
            onTap: () => onTap(2),
          ),
          navItem(
            Icons.account_circle_outlined,
            Icons.account_circle,
            pageIndex == 3,
            onTap: () => onTap(3),
          ),
        ],
      ),
    );
  }

  Widget navItem(IconData icon,IconData selectedIcon, bool isSelected, {Function()? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Icon(
          isSelected ? selectedIcon : icon,
          color: isSelected ? kBlack : kGrey300,
        ),
      ),
    );
  }
}