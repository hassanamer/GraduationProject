import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarttouristguide/layout/app_layout.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Palette.primaryColor,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfile()),
              );
            },
            icon: Icon(
              Icons.account_circle_rounded,
              color: Palette.primaryColor,
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryColor, Colors.teal],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.4, 0.9],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white70,
                      minRadius: 60.0,
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage('assets/testpic.jpg'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Hassan Amer',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.teal,
                    child: ListTile(
                      title: Text(
                        'Male',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        'Gender',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.teal,
                    child: ListTile(
                      title: Text(
                        '30/4/2000',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        'Date of Birth',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(children: <Widget>[
              ListTile(
                title: Text(
                  'Email',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'hassanamer281@gmail.com',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Divider(
                height: 1.0,
              ),
              ListTile(
                title: Text(
                  'Password',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '**************',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ]),
          ),
          Divider(
            height: 1.0,
          ),
          ListTile(
            title: Text(
              'Phone Number',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '01111302839',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Divider(
            height: 1.0,
          ),
          ListTile(
            title: Text(
              'Country',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Egypt',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
