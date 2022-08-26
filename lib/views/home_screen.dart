import 'package:flutter/material.dart';
// import 'package:my_car_records/controllers/CarForm.dart';

import '../controllers/car/car_form.dart';
import '../controllers/car/car_list.dart';

/// MyHomePage
///
/// this is the home screen that displays a the Carlist widget which is just a list of cars
///
/// @param title String this is the title of the app  to be displayed on the Appbar
///
// this page will ask user to login/signup then route to the corroponding pages
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(widget.title),
      ),
      body: CarList(refresh: refresh),
    );
  }
}
