import 'dart:math';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:layout/layout.dart';
import 'package:pico_user/presentation/configs/configs.dart';
import 'package:pico_user/presentation/utils/extensions/extensions.dart';
import 'package:pico_user/widgets/custom_paint.dart';

import '../route/routes.dart';


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
            body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListView(
        key: _key,
        controller: _scrollController,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: const [
          TopBarWidget(),
          SearchWidget(),
          SizedBox(height: 180, child: BannerWidget()),
          CategoryWidget(),
          SizedBox(child: BestSellingItemWidget()),
        ],
      ),
    )));
  }
}

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(120.0),
              child: Image.asset(
                "$basePath/girl.png",
                height: 35,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good morning",
                  style: context.labelMedium,
                ),
                Text(
                  "Ryan Aung",
                  style: context.titleExtraSmall,
                )
              ],
            ).addPadding(edgeInsets: const EdgeInsets.only(left: s18)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.location_on,
              color: kPrimary,
              size: 24,
            ),
            const Text(
              "My Office",
              style: TextStyle(color: kBlack, fontSize: 14, fontWeight: bold),
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              color: kGrey,
              size: 22,
            )
          ],
        )
            .addPadding(
                edgeInsets:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12))
            .addRoundCornerWidget(
                margin: const EdgeInsets.symmetric(vertical: 8),
                borderRadius: BorderRadius.circular(40))
      ],
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.search_sharp,
          color: kPrimary,
          size: 24,
        ),
        Text(
          "Search category",
          style: context.labelMedium,
        ).addPadding(edgeInsets: const EdgeInsets.only(left: 4))
      ],
    )
        .addPadding(
            edgeInsets: const EdgeInsets.symmetric(vertical: 8, horizontal: 6))
        .addRoundCornerWidget(
            margin: const EdgeInsets.symmetric(vertical: 8),
            borderRadius: BorderRadius.circular(20));
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
    var size = MediaQuery.of(context).size;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomPaint(
            painter: LeftCurveContainer(),
            child: Image.asset(
              "$vegetable/banner.png",
              height: 180,
              width: size.width * 0.43,
            ),
          ),
          CustomPaint(
            painter: RightCurveContainer(),
            child: SizedBox(
              width: size.width * 0.5,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Special Offers",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Get 20%",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  ButtonWidget(),
                ],
              ).addPadding(edgeInsets: const EdgeInsets.only(left: 45)),
            ),
          ),
        ],
      ),
    ).addPadding(edgeInsets: const EdgeInsets.only(right: 10));
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Grab Offer",
          style: TextStyle(color: kPrimary, fontSize: 16),
        ),
        Icon(
          Icons.arrow_forward_ios_sharp,
          color: kPrimary,
          size: 14,
        )
      ],
    )
        .addPadding(
            edgeInsets: const EdgeInsets.symmetric(vertical: 6, horizontal: 4))
        .addRoundCornerWidget(
            margin: const EdgeInsets.only(right: 26.0),
            borderRadius: const BorderRadius.all(Radius.circular(20)));
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Categories 😻",
              style: context.titleExtraSmall,
            ),
            Text(
              "See all",
              style: TextStyle(
                  color: kPrimary, fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ).addPadding(edgeInsets: const EdgeInsets.symmetric(vertical: 8)),
        SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return CategoryItem(index);
              },
            )),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  int index;

  CategoryItem(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var imgPath = categry_image[index];
    var txt = categories[index];
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 85,
          decoration: BoxDecoration(
            color: kGrey300,
            shape: BoxShape.circle,
          ),
          child: Container(
            padding: const EdgeInsets.all(18),
            child: Image.asset(
              imgPath,
            ),
          ),
        ),
        Text(
          txt,
          style: const TextStyle(color: kBlack, fontSize: 16),
        )
      ],
    ).addPadding(edgeInsets: const EdgeInsets.only(right: 10));
  }
}

class BestSellingItemWidget extends StatelessWidget {
  const BestSellingItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 1.5;
    return InkWell(
      onTap: (){
        Navigator.pushNamed(
          context,
          Routes.detail,
        );
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "BestSelling 🔥",
                style: context.titleExtraSmall,
              ),
              Text(
                "See all",
                style: TextStyle(
                    color: kPrimary, fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ).addPadding(edgeInsets: const EdgeInsets.symmetric(vertical: 8)),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                childAspectRatio: (itemWidth / itemHeight)),
            itemCount: best_selling_items.length,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return BestSellingItem(index);
            },
          )
        ],
      ),
    );
  }
}

class BestSellingItem extends StatelessWidget {
  int index;
  BestSellingItem(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    var txt = best_selling_items[index];
    var imgPath = item_img[index];
    return Column(
      children: [
        Image.asset(imgPath,height: 170,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(txt,style: context.titleExtraSmall,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("1kg, 2000 MMK ",style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(
                      width: 34,
                      height: 34,
                      child: IconButton(
                        icon: const Icon(
                          Icons.add, color: kWhite,
                          size: 16,),
                        onPressed: () {},
                      )
                          .addRoundCornerWidget(
                          margin: EdgeInsets.zero,
                          borderRadius: BorderRadius.circular(40),
                          color: kPrimary),
                    ),
                  ],
                )

              ],
            ).addPadding(edgeInsets: const EdgeInsets.symmetric(horizontal: 8)),
      ],
    ).addRoundCornerWidget(
        margin: const EdgeInsets.all(2.0),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: kGrey300);
  }
}
