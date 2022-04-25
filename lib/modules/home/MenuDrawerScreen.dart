import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/welcomScreen.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';

class menuDrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ChangeColorCubit(),
      child: BlocConsumer<ChangeColorCubit, ChangesStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Drawer(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: DrawerHeader(
                      decoration:
                          BoxDecoration(color: Theme.of(context).primaryColor),
                      child: Column(
                        children: [
                          Row(children: [
                            const SizedBox(width: 110),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.person,
                                    color: Theme.of(context).primaryColor,
                                    size: 50,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                const Text(
                                  'User name',
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white),
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
                                      onPressed: () {},
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
                      title: Text(
                        AppLocalizations.of(context)!.mood,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                            fontSize: 18),
                      ),
                      horizontalTitleGap: 80,
                      leading: Switch(
                          activeColor: Theme.of(context).primaryColor,
                          value: ChangeColorCubit.get(context).changeMode,
                          onChanged: (value) {
                            ChangeColorCubit.get(context).togaleMode();
                          })),
                  ListTile(
                      title: Text(
                        AppLocalizations.of(context)!.language,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                            fontSize: 18),
                      ),
                      horizontalTitleGap: 80,
                      leading: Switch(
                          activeColor: Theme.of(context).primaryColor,
                          value: ChangeColorCubit.get(context).changeLanguage,
                          onChanged: (value) {
                            ChangeColorCubit.get(context).togaleLanguage();
                            print(ChangeColorCubit().changeLanguage);
                          })),
                  const Spacer(),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).primaryColor),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.transparent)),
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(Welcome.routeName);
                          },
                          child: Text(AppLocalizations.of(context)!.log_out))),
                  const SizedBox(
                    height: 12,
                  )
                ],
              ),
            );
          }),
    );
  }
}
