import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/utils/sharedprefs.dart';
import 'package:my_car_records/views/home/ios_home.dart';
// import 'package:my_car_records/controllers/CarForm.dart';

import '../../model/user.dart';
import '../vehicle/car_forms/car_form.dart';
// import '../../controllers/car/car_list.dart';

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
  // final User? user = FirebaseAuth.instance.currentUser;
  late User? user = SharedPrefs.getUser();

  // @override
  // initState(){
  //   super.initState();

  // }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final User user = FirebaseAuth.instance.currentUser!;
    // final FirebaseFirestore firestore = FirebaseFirestore.instance;
    return Platform.isIOS
        ? IOSHomePage(key: iosHomeKey, user: user!, refresh: refresh)
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
                            // child: CarForm(user: user, refresh: refresh),
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
              title: const Text(homePageTitle),
            ),
            // body: CarList(refresh: refresh),
          );
  }
}
