import 'package:flutter/material.dart';
import 'ListVievOfEventAndOffer.dart';

class OfferScreen extends StatefulWidget {


  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  late int currentScreenIndex ;
  @override
  void initState() {
    super.initState();
    currentScreenIndex = 0;
  }
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).colorScheme.background,
      appBar:AppBar(
        centerTitle: true,
        title: Text('Offers'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.search))],
      ),
      body: ListVievOfEventAndOffer(),
        bottomNavigationBar: Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
        topRight: Radius.circular(20), topLeft: Radius.circular(20)),
    boxShadow: [
    BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
    ],
    ),
    child: ClipRRect(
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0),
    ),
    child: BottomNavigationBar(
    backgroundColor: Colors.white,
    currentIndex: currentScreenIndex,
    onTap: (index){
    setState(() {
    currentScreenIndex=index;
    });
    },
    showUnselectedLabels: false,
    showSelectedLabels: true,
    selectedItemColor: Theme.of(context).primaryColor ,
    unselectedItemColor: Theme.of(context).colorScheme.inversePrimary,
    type: BottomNavigationBarType.fixed ,
    items: [
    BottomNavigationBarItem(icon: Icon(Icons.home,size: 30,),label: ("Home")),
    BottomNavigationBarItem(icon: Icon(Icons.favorite,size: 30),label: ("favorite")),
    BottomNavigationBarItem(icon: Icon(Icons.category,size: 30),label: ("Category"))
    ],),

    )));
  }
}
