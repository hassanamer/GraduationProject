import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';

class menuDrawerScreen extends StatefulWidget {
  @override
  _menuDrawerScreenState createState() => _menuDrawerScreenState();
}

class _menuDrawerScreenState extends State<menuDrawerScreen> {
  bool isSwitchmood = false;
  bool isSwitchlanguage = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: DrawerHeader(
              decoration: const BoxDecoration(color: AppColors.primaryColor),
              child: Column(
                children: [
                  Row(children: [
                    const SizedBox(width: 110),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          child: InkWell(
                            onTap: () {
                              //   m7tgen           hana        al         profile        screen     (:
                            },
                            child: const Icon(
                              Icons.person,
                              color: AppColors.primaryColor,
                              size: 50,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'User name',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        const Text(
                          'Email',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                //  m7tgen     hana      al     screen     aly      hn3del   mnha   al   profile     (:
                              },
                              icon: const Icon(
                                Icons.edit_outlined,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ),
          ListTile(
              title: const Text(
                'mood',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                    fontSize: 18),
              ),
              horizontalTitleGap: 80,
              leading: Switch(
                  activeColor: AppColors.primaryColor,
                  value: isSwitchmood,
                  onChanged: (value) {
                    setState(() {
                      isSwitchmood = value;
                    });
                  })),
          ListTile(
              title: const Text(
                'language',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                    fontSize: 18),
              ),
              horizontalTitleGap: 80,
              leading: Switch(
                  activeColor: AppColors.primaryColor,
                  value: isSwitchlanguage,
                  onChanged: (value) {
                    setState(() {
                      isSwitchlanguage = value;
                    });
                  })),
          const Spacer(),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primaryColor),
              child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent)),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('welcomeScreen');
                  },
                  child: const Text('Log out'))),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}
