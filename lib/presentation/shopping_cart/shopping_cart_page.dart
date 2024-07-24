import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

import '../home/home_page.dart';

class ShoppingCartPage extends StatefulWidget{
  const ShoppingCartPage({super.key});

  @override
  State<StatefulWidget> createState() => _ShoppingCartPageState();

}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("My Lov"),
      ),
      body: const SizedBox(
          child: ItemPage()),
    );
  }
}