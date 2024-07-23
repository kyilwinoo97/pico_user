import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:layout/layout.dart';
import 'package:pico_user/presentation/configs/configs.dart';
import 'package:pico_user/presentation/utils/extensions/widget_ex.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Layout(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Pico User"),
              titleSpacing: 20.0,
              leading: const Icon(
                Icons.location_on_outlined,
                color: Colors.black,
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ))
              ],
            ),
            body: ListView(
              key: _key,
              controller: _scrollController,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: const [
                SizedBox(height: 180, child: BannerWidget()),
                Text(
                  "Popular Items",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                    child: ItemPage()),
              ],
            )));
  }
}

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const BannerItem();
        });
  }
}

class BannerItem extends StatelessWidget {
  const BannerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Something").addPadding(
                edgeInsets: const EdgeInsets.symmetric(vertical: 10)),
            Text("Another")
          ],
        ).addPadding(edgeInsets: EdgeInsets.symmetric(horizontal: 6.0)),
        Image.asset("assets/img/medical_team.png")
      ],
    ).addRoundCornerWidget();
  }
}

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return MasonryGridView.count(
      crossAxisCount: (orientation == Orientation.portrait)? 2: 3,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      itemCount: 10,
      shrinkWrap: true,
      physics:  const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return SingleItemWidget(index);
      },
    );
    // return GridView.builder(
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
    //     mainAxisSpacing: 1.0,
    //     crossAxisSpacing: 1.0,
    //   ),
    //   itemCount: 10,
    //   physics: const ClampingScrollPhysics(),
    //   shrinkWrap: true,
    //   itemBuilder: (context, index) {
    //     return const SingleItemWidget();
    //   },
    // );
  }
}

class SingleItemWidget extends StatelessWidget {
  int index;
  SingleItemWidget(this.index,{super.key});
  @override
  Widget build(BuildContext context) {
    var random = Random().nextInt(14);
    return SizedBox(
      height: index <= random ? 230 : 200 ,
      child: Column(
        children: [
          Image.asset(
            "assets/img/medical_team.png",
            fit: BoxFit.contain,
            height: 140,
          ),
          const Text("100.0 \$"),
          const Text("Details of item")
        ],
      ).addRoundCornerWidget(),
    );
  }
}
