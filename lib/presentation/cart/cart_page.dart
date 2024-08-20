import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pico_user/data/model/item.dart';
import 'package:pico_user/presentation/cart/bloc/cart_bloc.dart';
import 'package:pico_user/presentation/configs/configs.dart';
import 'package:pico_user/presentation/utils/extensions/extensions.dart';

import '../configs/constant_colors.dart';
import '../detail/item_detail.dart';
import '../route/routes.dart';

class CartPage extends StatefulWidget{
  const CartPage({super.key});

  @override
  State<StatefulWidget> createState() => _CartPageState();

}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    Map<String, List<Item>> cartItem;
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
      body: BlocBuilder<CartBloc,CartState>(
        builder: (context,state){
          if(state is Success){
            cartItem = state.cart;
            return Container(
              margin: const EdgeInsets.only(bottom: 80),
              child: ListView(
                children: [
                  ListView.builder(
                    itemCount: cartItem.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var keys = cartItem.keys.toList();
                      var data = cartItem[keys[index]];
                      if(data != null && data.isNotEmpty){
                        return CartItem(data);
                      }
                        return const SizedBox.shrink();

                    },
                  )
                ],
              ),
            );
          }else if (state is Loading){
            return Center(child: CircularProgressIndicator(color: kPrimary,),);
          }else if(state is Empty){
            return Center(child: Text("Empty Item",style: TextStyle(
              color: kPrimary
            ),),);
          }
          return const Center(child: Text("Something went wrong",style: TextStyle(
              color: Colors.red
          ),),);;

        },
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
    BlocBuilder<CartBloc,CartState>(
    builder: (context,state){
      if(state is Success){
        return  InkWell(
          onTap: (){
            Navigator.pushNamed(
              context,
              Routes.order,
            );
          },
          child: Container(
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
      return const SizedBox.shrink();
    }
    )

    );
  }

  void getData() {
    BlocProvider.of<CartBloc>(context).add(GetCart());
  }
}

class CartItem extends StatelessWidget {
  List<Item> itemList;
  CartItem(this.itemList, {super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("item size ${itemList.length}");
    Item item = itemList.first;
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
        CountWithButton(itemList.length,remove: (){
          BlocProvider.of<CartBloc>(context).add(RemoveFromCart(item));
        },
          add: (){
          BlocProvider.of<CartBloc>(context).add(AddToCart(item));

        },),
      ],
    ).addPadding(edgeInsets: const EdgeInsets.symmetric(horizontal: 8));
  }
}