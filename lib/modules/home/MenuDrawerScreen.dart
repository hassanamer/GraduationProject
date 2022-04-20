import 'package:flutter/material.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/welcomScreen.dart';
import 'package:smarttouristguide/shared/styles/buttons_style.dart';
class menuDrawerScreen extends StatefulWidget {
  @override
  _menuDrawerScreenState createState() => _menuDrawerScreenState();
}

class _menuDrawerScreenState extends State<menuDrawerScreen> {
  bool isSwitchmood = false;
  bool isSwitchlanguage = false;
  @override
  Widget build(BuildContext context) {
    return Drawer( child: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*0.35,
          child: DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child:Column(
              children: [
                Row(
                    children: [SizedBox(width: 110),Column(children: [CircleAvatar(radius: 40,backgroundColor: Colors.white,child: Icon(Icons.person,color: Theme.of(context).primaryColor,size: 50,),),
                      SizedBox(height: 16,),
                      Text('User name',style: TextStyle(fontSize: 24,color: Colors.white),),
                      Text('Email',style: TextStyle(color: Colors.white),),],),SizedBox(width: 30,),Container(height: MediaQuery.of(context).size.height*0.2,
                      child: Column(
                        children: [
                          IconButton(onPressed: (){},
                              icon: Icon(Icons.edit_outlined,color: Colors.white,)),

                        ],
                      ),
                    )]),



              ],
            ),
          ),
        ),
        ListTile(
            title:Text('mood',style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,fontSize: 18),),
            horizontalTitleGap: 80,
            leading: Switch(activeColor: Theme.of(context).primaryColor ,value: isSwitchmood, onChanged:(value){setState(() {
              isSwitchmood = value;
            });} )
        ),ListTile(
            title:Text('language',style: TextStyle(fontWeight: FontWeight.bold,color:Theme.of(context).primaryColor,fontSize: 18),),
            horizontalTitleGap: 80,
            leading: Switch(activeColor: Theme.of(context).primaryColor ,value: isSwitchlanguage, onChanged:(value){setState(() {
              isSwitchlanguage = value;
            });} )
        ),
        Spacer(),
        Container(padding: EdgeInsets.symmetric(horizontal: 16),
            child: button(function: (){{Navigator.of(context).pushNamed(
                Welcome.routeName
            );}}, text: 'Log Out')),
        SizedBox(height: 12,)

      ],
    ),
    );
  }
}
