import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pico_user/data/model/item.dart';
import 'package:pico_user/presentation/configs/configs.dart';
import 'package:pico_user/presentation/utils/extensions/extensions.dart';

import '../cart/bloc/cart_bloc.dart';
import '../configs/constant_colors.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({super.key});

  @override
  State<StatefulWidget> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
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
            "Confirm Order 🛒",
            style: context.titleExtraSmall,
          ),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is Success) {
              var cartItem = state.cart;
              return Container(
                margin: const EdgeInsets.only(bottom: 80),
                child: ListView(
                  children: [
                    const AddressWidget(),
                    ListView.builder(
                      itemCount: cartItem.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        var keys = cartItem.keys.toList();
                        var data = cartItem[keys[index]];
                        if (data != null && data.isNotEmpty) {
                          return ConfirmOrderItem(data);
                        }
                        return const SizedBox.shrink();
                      },
                    ).addRoundCornerWidget(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 7),
                        borderRadius: BorderRadius.circular(14),
                        color: kGrey300),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: TotalWidget(cartItem),
                    )
                  ],
                ),
              );
            } else if (state is Loading) {
              return Center(
                child: CircularProgressIndicator(
                  color: kPrimary,
                ),
              );
            } else if (state is Empty) {
              return Center(
                child: Text(
                  "Empty Item",
                  style: TextStyle(color: kPrimary),
                ),
              );
            }
            return const Center(
              child: Text(
                "Something went wrong",
                style: TextStyle(color: Colors.red),
              ),
            );
            ;
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
            BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          if (state is Success) {
            return InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: kPrimary, borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text(
                    'Continue To Pay',
                    style: TextStyle(color: kWhite, fontSize: 16),
                  ),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        }));
  }

  void getData() {
    BlocProvider.of<CartBloc>(context).add(GetCart());
  }
}

class TotalWidget extends StatelessWidget {
  Map<String, List<Item>> cartItem;

  TotalWidget(this.cartItem, {super.key});

  @override
  Widget build(BuildContext context) {
    var subtotal = 0.0;
    for (var v in cartItem.values) {
      subtotal += v.length * v.first.price;
    }
    var total = 0.0;
    const serviceFee = 500;
    const deliverCharge = 1500;
    total = subtotal + serviceFee + deliverCharge;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Sub Total",
                style: TextStyle(
                  color: kBlack,
                  fontSize: 16
                ),
              ),
              Text("$subtotal ks")
            ],
          ),
         const SizedBox(height: 4),
         const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Service Fee",
                style: TextStyle(
                    color: kBlack,
                    fontSize: 16
                ),
              ),
              Text("$serviceFee ks")
            ],
          ),
          const SizedBox(height: 4),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery Charge",
                style: TextStyle(
                    color: kBlack,
                    fontSize: 16
                ),
              ),
              Text("$deliverCharge ks")
            ],
          ),
         const  SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(
                    color: kBlack,
                    fontSize: 16
                ),
              ),
              Text("$total ks")
            ],
          ),
        ],
      ),
    )
    .addPadding(edgeInsets: const EdgeInsets.all(14))
        .addRoundCornerWidget(margin: const EdgeInsets.symmetric(vertical: 18,horizontal: 14),
        borderRadius: BorderRadius.circular(14),
    color: kGrey300);
  }
}

class AddressWidget extends StatelessWidget {
  const AddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Deliver to ",
                style: TextStyle(color: kBlack, fontSize: 16),
              ),
              Text(
                "Office",
                style: TextStyle(
                    color: kPrimary, fontStyle: FontStyle.italic, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          const Text("49 Featherstone Street,"),
          const Text("London")
        ],
      ).addPadding(edgeInsets: const EdgeInsets.all(14)).addRoundCornerWidget(
          margin: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 7),
          borderRadius: BorderRadius.circular(14),
          color: kGrey300),
    );
  }
}

class ConfirmOrderItem extends StatelessWidget {
  List<Item> data;

  ConfirmOrderItem(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    var item = data.first;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.name,
          style: context.titleExtraSmall,
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text("${data.length} kg"),
                const SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.circle_sharp,
                  size: 6,
                  color: kPrimary,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text("${item.price} ks")
              ],
            ),
            Text("${data.length * item.price} ks")
          ],
        )
      ],
    ).addPadding(
        edgeInsets: const EdgeInsets.symmetric(horizontal: 10, vertical: 8));
  }
}
