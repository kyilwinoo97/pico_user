import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

class ShoppingCartPage extends StatefulWidget{
  const ShoppingCartPage({super.key});

  @override
  State<StatefulWidget> createState() => _ShoppingCartPageState();

}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Layout(
        child: Scaffold(
          body: Text("My cart"),
        )
    );
  }
}