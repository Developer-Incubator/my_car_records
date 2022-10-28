import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_car_records/controllers/login_page.dart';

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

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Car Records',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          primaryColor: Colors.blueGrey.shade600,
          fontFamily: "NunitoSans"),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MyHomePage(title: 'My Car Records');
          }
          return const LoginPage();
        },
      ),
    );

    //   FutureBuilder(
    //     future: _fbApp,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) {
    //         debugPrint("There was an error! ${snapshot.error.toString()}");
    //         return const Text("Something went wrong");
    //       } else if (snapshot.hasData) {
    //         // return const MyHomePage(title: 'My Car Records');
    //         return const LoginPage();
    //       } else {
    //         return const Center(
    //           child: SizedBox(
    //             width: 60,
    //             height: 60,
    //             child: CircularProgressIndicator(),
    //           ),
    //         );
    //       }
    //     },
    //   ),
    // );
  }
}
