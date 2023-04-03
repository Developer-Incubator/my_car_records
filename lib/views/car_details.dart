import 'package:flutter/material.dart';
import 'package:my_car_records/controllers/car/car_info.dart';
import 'package:my_car_records/model/car.dart';
import 'package:my_car_records/model/db/car_reat_time.dart';

// ignore: must_be_immutable
class CarDetailsPage extends StatefulWidget {
  final String vin;
  CarDetailsPage({Key? key, required this.vin}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  late var car;

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  @override
  Widget build(BuildContext context) {
    // widget.car = getACar(widget.vin);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Car Details"),
        ),
        body: FutureBuilder(
            future: widget.car,
            builder: (BuildContext context, AsyncSnapshot<Car> snapshot) {
              Widget child;
              if (snapshot.hasData) {
                child = CarInfo(car: snapshot.data);
              } else if (snapshot.hasError) {
                child = const Text("Error populating list");
                debugPrint("Error populating list");
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
            }));
  }
}
