import 'package:flutter/material.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/registerContinarWithSpacer.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/register_container.dart';

class SignUpScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,
      child: Column(
        children: [

          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 12),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
                children: [RegisterContainer('First Name'),SizedBox(width: 24),
                  RegisterContainer('Last Name'),
                  RegisterContainer('Email Address'),
                  RegisterContainer(('Password')),
                  RegisterContainer(('Confirm Password')),
                  RegisterContainer('phone number'),
                  RegisterContainer('Date of Birth'),
                  registerContinarWithSpacer('Gender'),
                  registerContinarWithSpacer('Country'),




                  //  RegisterContainer.icon('Country',),
                  Container(
                    margin:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 80),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Theme.of(context).primaryColor),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor: MaterialStateProperty.all(
                              Colors.transparent)),
                      onPressed: () {},
                      child: Text('Submit'),
                    ),
                  )
                ],),
            ),
          )
          ,   //buttons('submit')

        ],
      ),);
  }
}
