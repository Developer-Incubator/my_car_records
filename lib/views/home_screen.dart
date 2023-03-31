import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_car_records/constance/constance.dart';
// import 'package:my_car_records/controllers/CarForm.dart';

import '../controllers/car/car_form.dart';
import '../controllers/car/car_list.dart';

/// MyHomePage
///
/// this is the home screen that displays a the Carlist widget which is just a list of cars
///
/// @param user UserCredential this is the title of the app  to be displayed on the Appbar
///
// this page will ask user to login/signup then route to the corroponding pages
class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final uid = user.uid;
      print(uid);
    }

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: CupertinoNavigationBar(
            middle: Text(
              homePageTitle,
              style: const TextStyle(color: Colors.white),
            ),
            leading: CupertinoButton(
              child: const Icon(
                CupertinoIcons.person_fill,
              ),
              onPressed: () => Navigator.pushNamed(context, '/profile'),
            ),
            trailing: CupertinoButton(
              child: const Icon(
                CupertinoIcons.add,
              ),
              onPressed: () => showCupertinoDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) {
                    return CupertinoPopupSurface(
                        isSurfacePainted: false,
                        child: CarForm(refresh: refresh)
                        // ListView(
                        //   children: [
                        //     Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //       children: [
                        //         CupertinoButton(
                        //           color: CupertinoColors.destructiveRed,
                        //           child: const Text("Cancel"),
                        //           onPressed: () => Navigator.pop(context),
                        //         ),
                        //         CupertinoButton(
                        //           color: CupertinoColors.activeGreen,
                        //           child: const Text("Save"),
                        //           onPressed: () => Navigator.pop(context),
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                        );
                  }),
            ),
          ))
        : Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                IconButton(
                  // navigates to the CarForm widget to add a car then refreshes the page when returned
                  onPressed: (() {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: const Text('Car Form'),
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CarForm(refresh: refresh),
                          ),
                        );
                      },
                    ).then(
                      (value) {
                        refresh();
                      },
                    );
                  }),
                  icon: const Icon(Icons.add),
                ),
              ],
              // Here we take the value from the MyHomePage object that was created by
              title: Text(homePageTitle),
            ),
            body: CarList(refresh: refresh),
          );
  }
}
