import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'views/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

/// MyApp
///
/// Sets the database connection. checks if the connecton was successful for the user to procede. will show the home screen
///
class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Car Records',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            debugPrint("There was an error! ${snapshot.error.toString()}");
            return const Text("Something went wrong");
          } else if (snapshot.hasData) {
            return const MyHomePage(title: 'My Car Records');
          } else {
            
            return const Center(
              child: SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
