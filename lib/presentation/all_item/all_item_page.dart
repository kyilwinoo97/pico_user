import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:pico_user/presentation/configs/configs.dart';
import 'package:pico_user/presentation/utils/extensions/extensions.dart';

import '../configs/constant_string.dart';
import '../home/home_page.dart';

class AllItemPage extends StatefulWidget {
  const AllItemPage({super.key});

  @override
  State<StatefulWidget> createState() => _AllItemPageState();
}

class _AllItemPageState extends State<AllItemPage> {
  final _scrollController = ScrollController();
  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 1.5;
    return Layout(
      child: Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leading: null,
          title: Text("Favourite ❤️",style: context.titleExtraSmall,),
        ),
        body: ListView(
          key: _key,
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  childAspectRatio: (itemWidth / itemHeight)),
              itemCount: bestSellingItem.length,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return BestSellingItem(index);
              },
            )
          ],
        ),
      ),
    );
  }
}
