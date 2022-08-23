import 'package:flutter/material.dart';
// import 'package:my_car_records/controllers/AllCars.dart';
import 'package:my_car_records/controllers/car_info.dart';
import 'package:my_car_records/model/database.dart';

class CarDetailsPage extends StatelessWidget {
  final String vin;
  const CarDetailsPage({Key? key, required this.vin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<List> car = getACar(vin);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Car Details"),
        ),
        body: FutureBuilder(
            future: car,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              Widget child;
              if (snapshot.hasData) {
               
                child = CarInfo(car: snapshot.data);
              } else if (snapshot.hasError) {
                child = const Text("Error populating list");
                print("Error populating list");
              } else {
                child = const SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                );
                
              }
              return Container(
                child: child,
              );
            })
        );
  }
}
