import 'package:flutter/material.dart';
import 'package:smarttouristguide/modules/Event&Offer&Places/places/listViewOfPlaces.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

class PlaceScreen extends StatefulWidget {
  @override
  State<PlaceScreen> createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  late int currentScreenIndex;
  @override
  void initState() {
    super.initState();
    currentScreenIndex = 0;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Places'),
          backgroundColor: AppColors.primaryColor,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: ListViewOfPlaces(),
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: const Radius.circular(20.0),
                topRight: const Radius.circular(20.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                currentIndex: currentScreenIndex,
                onTap: (index) {
                  setState(() {
                    currentScreenIndex = index;
                  });
                },
                showUnselectedLabels: false,
                showSelectedLabels: true,
                selectedItemColor: AppColors.primaryColor,
                unselectedItemColor: AppColors.disabledAndHintColor,
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        size: 30,
                      ),
                      label: ("Home")),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite, size: 30),
                      label: ("favorite")),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category, size: 30), label: ("Category"))
                ],
              ),
            )));
  }
}
