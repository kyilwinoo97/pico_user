import 'package:flutter/material.dart';
import 'package:pico_user/presentation/configs/configs.dart';
import 'package:pico_user/presentation/utils/extensions/extensions.dart';

import '../configs/constant_colors.dart';

class SelectPayment extends StatefulWidget {
  Object? data;

  SelectPayment(this.data, {super.key});

  @override
  State<StatefulWidget> createState() => _SelectPaymentState();
}

class _SelectPaymentState extends State<SelectPayment> {
  var groupValue = -1;
  @override
  Widget build(BuildContext context) {
    var total = widget.data as double;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox(
            width: 22,
            height: 22,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                size: 18,
                color: kBlack,
              ),
            )),
        title: Text(
          "Payment Options",
          style: context.titleExtraSmall,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          walletPayment(),
          const Divider(
            color: Colors.grey,
          ).addPadding(edgeInsets: const EdgeInsets.symmetric(horizontal: 14)),
          cashPayment(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {},
        child: Container(
          height: 50,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: kPrimary, borderRadius: BorderRadius.circular(20)),
          child: const Center(
            child: Text(
              'Confirm',
              style: TextStyle(color: kWhite, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  Widget walletPayment() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Wallet",
          style: context.titleExtraSmall,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: const Image(
                  image: AssetImage("$payment/kbzpayicon.jpg"),
                  height: 70,
                  width: 70,
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Text("KBZ Pay", style: context.titleExtraSmall)
            ],),
            Radio(
                value: 0,
                groupValue: groupValue,
                onChanged: onChange)
          ],
        ).addPadding(edgeInsets: const EdgeInsets.all(6)).addRoundCornerWidget(
            margin: const EdgeInsets.all(8),
            borderRadius: BorderRadius.circular(14),
            color: kGrey300),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: const Image(
                  image: AssetImage("$payment/wave(512).jpg"),
                  height: 65,
                  width: 65,
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Text("Wave Money", style: context.titleExtraSmall)
            ],),
            Radio(
                value: 1,
                groupValue: groupValue,
                onChanged: onChange)
          ],
        ).addPadding(edgeInsets: const EdgeInsets.all(6)).addRoundCornerWidget(
            margin: EdgeInsets.all(8),
            borderRadius: BorderRadius.circular(14),
            color: kGrey300),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: const Image(
                  image: AssetImage("$payment/truemoney.jpg"),
                  height: 65,
                  width: 65,
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Text("Wave Money", style: context.titleExtraSmall)
            ],),
            Radio(
                value: 2,
                groupValue: groupValue,
                onChanged: onChange)
          ],
        ).addPadding(edgeInsets: const EdgeInsets.all(6)).addRoundCornerWidget(
            margin: EdgeInsets.all(8),
            borderRadius: BorderRadius.circular(14),
            color: kGrey300),
      ],
    ).addPadding(edgeInsets: const EdgeInsets.symmetric(horizontal: 12));
  }



  Widget cashPayment() {
    var selectedRadio = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Text(
        "Cash",
        style: context.titleExtraSmall,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: const Image(
                image: AssetImage("$payment/cash.png"),
                height: 70,
                width: 70,
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            Text("Cash on Delivery", style: context.titleExtraSmall)
          ],),
          Radio(
              value: 3,
              groupValue: groupValue,
              onChanged: onChange)

        ],
      ).addPadding(edgeInsets: const EdgeInsets.all(6)).addRoundCornerWidget(
          margin: const EdgeInsets.all(8),
          borderRadius: BorderRadius.circular(14),
          color: kGrey300),
    ]).addPadding(edgeInsets: const EdgeInsets.symmetric(horizontal: 12));
  }

  void onChange(int? value) {
      setState(() {
        groupValue = value!;
      });
  }
}
