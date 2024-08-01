import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:layout/layout.dart';
import 'package:pico_user/presentation/configs/configs.dart';
import 'package:pico_user/presentation/utils/extensions/extensions.dart';
import 'package:pico_user/widgets/custom_paint.dart';

import '../configs/constant_assets.dart';

class ItemDetail extends StatefulWidget {
  const ItemDetail({super.key});

  @override
  State<StatefulWidget> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: kGrey300));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Layout(
        child: Scaffold(
      body: Column(
        children: [
          CustomPaint(
              painter: BottomCurveContainer(),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "$vegetable/potato.png",
                    height: size.height * 0.45,
                    width: size.width,
                  ),
                  Positioned(
                    top: 40,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 34,
                          height: 34,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_sharp,
                              color: kBlack,
                              size: 16,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ).addRoundCornerWidget(
                              margin: EdgeInsets.zero,
                              borderRadius: BorderRadius.circular(40)),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 34,
                              height: 34,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.share_rounded,
                                  color: kBlack,
                                  size: 16,
                                ),
                                onPressed: () {},
                              ).addRoundCornerWidget(
                                  margin: EdgeInsets.zero,
                                  borderRadius: BorderRadius.circular(40)),
                            ),
                            const SizedBox(width: 14,),
                            SizedBox(
                              width: 34,
                              height: 34,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: kBlack,
                                  size: 16,
                                ),
                                onPressed: () {},
                              ).addRoundCornerWidget(
                                  margin: EdgeInsets.zero,
                                  borderRadius: BorderRadius.circular(40)),
                            ),
                          ],
                        )

                      ],
                    ),
                  )
                ],
              )),
          const SizedBox(
            height: 36,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fresh Potato",
                    style: context.titleExtraSmall,
                  ),
                   CountWithButton(0),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "1kg, 2000 MMK ",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                  "Potatoes are underground tubers that grow on the roots of the potato plant, Solanum tuberosum. This plant is from the nightshade family and related to tomatoes and tobacco",
              style: context.labelMedium,
              textAlign: TextAlign.start,)
            ],
          ).addPadding(edgeInsets: const EdgeInsets.symmetric(horizontal: 12)),

        ],
      ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: kPrimary,
              borderRadius: BorderRadius.circular(20)
            ),
            child: const Center(
                child: Text('Add to Cart',
                style: TextStyle(color: kWhite,fontSize: 16),),
            ),
          ),
          ),
    );
  }
}

class CountWithButton extends StatelessWidget {
  int quantity;
   CountWithButton(this.quantity, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 34,
            height: 34,
            child: IconButton(
              icon: const Icon(
                Icons.remove,
                color: kBlack,
                size: 16,
              ),
              onPressed: () {},
            ).addRoundCornerWidget(
                margin: EdgeInsets.zero,
                borderRadius: BorderRadius.circular(40),
                color: kGrey300),
          ),
          Text(
            "$quantity",
            style: context.titleExtraSmall,
          ),
          SizedBox(
            width: 34,
            height: 34,
            child: IconButton(
              icon: const Icon(
                Icons.add,
                color: kWhite,
                size: 16,
              ),
              onPressed: () {},
            ).addRoundCornerWidget(
                margin: EdgeInsets.zero,
                borderRadius: BorderRadius.circular(40),
                color: kPrimary),
          ),
        ],
      ),
    );
  }
}
