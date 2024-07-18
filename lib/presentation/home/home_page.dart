import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pico_user/presentation/configs/configs.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Pico"),),
      body: Column(children: [
        Text("Home")
      ],),
    );
  }
}