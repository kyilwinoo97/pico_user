import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pico_user/data/model/item.dart';
import 'package:pico_user/presentation/configs/configs.dart';
import 'package:pico_user/presentation/utils/extensions/extensions.dart';

import '../configs/constant_colors.dart';
import '../detail/item_detail.dart';

class CartPage extends StatefulWidget{
  const CartPage({super.key});

  @override
  State<StatefulWidget> createState() => _CartPageState();

}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    var cartItem = cart;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox(
          width: 22,
          height: 22,
          child: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_sharp,size: 18,color: kBlack,),
          )
        ),
        title: Text("Cart 🛒",style: context.titleExtraSmall,),
      ),
      body: Column(
        children: [
          ListView.builder(
            itemCount: cartItem.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              var data = cartItem[index];
              return CartItem(data!);
            },
          )
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
          child: Text('Checkout',
            style: TextStyle(color: kWhite,fontSize: 16),),
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  List<Item> itemList;
  CartItem(this.itemList, {super.key});

  @override
  Widget build(BuildContext context) {
    var item = itemList.first;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(item.imageUrl,height: 80,width: 80,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name,style: context.titleExtraSmall,),
                 Text("${item.unit}, ${item.price.toInt()} MMK ",style: const TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                ),)
              ],).addPadding(edgeInsets: const EdgeInsets.only(left: 4.0)),
          ],
        ),
        CountWithButton(itemList.length),
      ],
    ).addPadding(edgeInsets: const EdgeInsets.symmetric(horizontal: 8));
  }
}