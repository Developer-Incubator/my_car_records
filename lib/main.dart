import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/constance/routes.dart';
import 'package:my_car_records/views/login/login.dart';
import 'package:my_car_records/views/register.dart';

import 'views/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

/// MyApp
///
/// Sets the database connection. checks if the connecton was successful for the user to procede. will show the home screen
///
class MyApp extends StatelessWidget {
  // final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  // bool isLoading = false;

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoApp(
            debugShowCheckedModeBanner: false,

            navigatorKey: navKey,
            routes: routes,
            theme: CupertinoThemeData(
              barBackgroundColor: Colors.blueGrey.shade600,
              primaryColor: Colors.blueGrey,
              textTheme: const CupertinoTextThemeData(
                primaryColor: Colors.white,

                // navActionTextStyle: TextStyle(color: Colors.white),
                textStyle:
                    TextStyle(fontFamily: "NunitoSans", color: Colors.blueGrey),
              ),
            ),
            // initialRoute: "/login",
            home: const LoginPage(),
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navKey,
            theme: ThemeData(
                primarySwatch: Colors.blueGrey,
                primaryColor: Colors.blueGrey.shade600,
                fontFamily: "NunitoSans"),
            routes: routes,
            initialRoute: "/login",
          );
  }
}
