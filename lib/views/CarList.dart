import 'package:flutter/material.dart';

import 'package:my_car_records/controllers/AllCars.dart';
import 'package:my_car_records/model/database.dart';


/// Gets a list of all the cars , checks if the future lst has aby data. if so procede to populate page, if not than a text widget will appear. Untill one of those happen a circle progression will appear as a loading screen 
class CarList extends StatelessWidget {
  // list of all the cars 
  final Future<List> cars = getCars();
  
  CarList({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: cars,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = showAllCars(snapshot,context);
          } else if (snapshot.hasError) {
            children = [];
            print("Error populating list");
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
            ];
          }
          return ListView(
              
              children: children,
            );
    
          
        });
  }
}


