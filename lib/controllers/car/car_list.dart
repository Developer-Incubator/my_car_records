import 'package:flutter/material.dart';

import 'package:my_car_records/controllers/car/all_cars.dart';
import 'package:my_car_records/model/db/car.dart';

/// Gets a list of all the cars , checks if the future lst has any data. if so procede to populate page, if not than a text widget will appear. Untill one of those happen a circle progression will appear as a loading screen
///
///[refresh] resets the state of the parent widget
// ignore: must_be_immutable
class CarList extends StatelessWidget {
  CarList({Key? key, required this.refresh}) : super(key: key);
   Function refresh;

   Future swipeRefresh() async{
    refresh();
  }

  late Future<List> cars = getCars();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: cars,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = showAllCars(snapshot, context, refresh);
          } else if (snapshot.hasError) {
            children = [const Text("Error Populating Data")];
            debugPrint("Error populating list");
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
            ];
          }
          return RefreshIndicator(onRefresh:()=> swipeRefresh(), child: ListView(
            children: children,
          )) 
          ;
        });
  }
}
