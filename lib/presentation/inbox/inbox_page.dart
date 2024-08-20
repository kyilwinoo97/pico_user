import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pico_user/presentation/configs/configs.dart';
import 'package:pico_user/presentation/utils/extensions/extensions.dart';
import 'package:pico_user/presentation/utils/extensions/widget_ex.dart';

class InboxPage extends StatefulWidget{
  const InboxPage({super.key});

  @override
  State<StatefulWidget> createState() => _InboxPageState();

}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(
        centerTitle: true,
        leading: null,
        title: Text("Message 📢",style: context.titleExtraSmall,),
      ),
      body: ListView.builder(
        itemCount: 20,
          physics:const ClampingScrollPhysics(),
          itemBuilder: (context,index){
        return  InboxItem(index);
      }),
    );
  }
}

class InboxItem extends StatelessWidget{
  int index;
   InboxItem(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(120.0),
          child: Icon(Icons.notifications_active,color: kPrimary,size: 35,),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text("Message Notification Description",style: context.bodySmall,),
            const SizedBox(height: 3,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("10/10/2024",style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12
                ),),
                SizedBox(width: 120,),
                Text("10:00 AM",style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12
                ),)
              ],
            ),
          ],
        ).addPadding(edgeInsets: const EdgeInsets.symmetric(horizontal: 12)).addExpanded(),
      ],
    )
        .addPadding(edgeInsets: const EdgeInsets.symmetric(vertical: 4))
        .addRoundCornerWidget(margin: const EdgeInsets.symmetric(vertical: 4,horizontal: 12), borderRadius:
        BorderRadius.circular(4.0),
        color: (index < 4) ? Colors.grey.shade200: Colors.white);
  }

}