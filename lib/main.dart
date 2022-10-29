import 'package:firebase_auth/firebase_auth.dart';
<<<<<<< Updated upstream
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_car_records/views/login_page.dart';
=======
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_car_records/model/firebase/firebase.dart';
import 'package:my_car_records/views/login_page.dart';
import 'package:my_car_records/views/signup_page.dart';
>>>>>>> Stashed changes

import 'views/home_screen.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp();
<<<<<<< Updated upstream
  
=======
  await MyFirebase().init();
  FirebaseMessaging.onMessage
      .listen((RemoteMessage message) {
        print('Got a message whilst in the foreground!');
        print('Message data: ${message.data}');

        if (message.notification != null) {
          print(
              'Message also contained a notification: ${message.notification!.body}');
        }
      });
>>>>>>> Stashed changes
  runApp(const MyApp());
}

/// MyApp
///
/// Sets the database connection. checks if the connecton was successful for the user to procede. will show the home screen
///
class MyApp extends StatelessWidget {
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
=======
      routes: {
        "/signup": (context) => const SignupPage(),
      },
>>>>>>> Stashed changes
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
