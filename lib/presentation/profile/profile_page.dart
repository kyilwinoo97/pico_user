import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pico_user/presentation/configs/configs.dart';
import 'package:pico_user/presentation/utils/extensions/extensions.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: null,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("My Account ",style: context.titleExtraSmall,),const Icon(Icons.account_circle,color: Colors.pinkAccent,)],),
      ),
      body: Column(
        children: [
          profileWidget(context),
          settingWidget(context,Icons.location_on_sharp,"Saved Address"),
          settingWidget(context,Icons.local_offer_outlined,"Offers"),
          settingWidget(context,Icons.sticky_note_2_sharp,"Terms & Conditions"),
          settingWidget(context,Icons.support,"Support"),
          settingWidget(context,Icons.settings,"Settings"),
          settingWidget(context,Icons.logout,"Logout"),
        ],
      ),
    );
  }

  Widget profileWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Ryan Aung",style:context.titleExtraSmall),
        const SizedBox(height: 10,),
        Row(children: [
          Icon(Icons.phone,color: kPrimary,),
          const SizedBox(width: 6,),
          const Text("+66342244554"),
        ],),
        const SizedBox(height: 10,),
        Row(children: [
          Icon(Icons.email,color: kPrimary,),
          const SizedBox(width: 6,),
          const Text("ryanaung123@gmail.com"),
        ],)
      ],
    )
    .addPadding(edgeInsets: EdgeInsets.all(8.0))
        .addRoundCornerWidget(margin: EdgeInsets.all(14), borderRadius: BorderRadius.circular(14)
    ,color: kGrey200);
  }

  Widget settingWidget(BuildContext context,IconData icon,String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Icon(icon,color: kPrimary,size: 24,),
          const SizedBox(width: 6,),
           Text(text),
        ],),
        const SizedBox(height: 10,),
      ],
    )
        .addPadding(edgeInsets: EdgeInsets.all(8.0))
        .addRoundCornerWidget(margin: EdgeInsets.symmetric(vertical: 8,horizontal: 14), borderRadius: BorderRadius.circular(14)
        ,color: kGrey200);
  }
}