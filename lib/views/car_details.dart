import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/controllers/car/car_info.dart';
import 'package:my_car_records/model/car.dart';
import 'package:my_car_records/views/car_details/ios_car_details.dart';

class CarDetailsPage extends StatefulWidget {
  final String carId;
  final String make;
  final String model;
  final String year;
  final String? vin;
  const CarDetailsPage({
    Key? key,
    required this.carId,
    required this.make,
    required this.model,
    required this.year,
    this.vin,
  }) : super(key: key);

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  @override
  Widget build(BuildContext context) {
    // widget.car = getACar(widget.vin);
    return Platform.isIOS
        ? IOSCarDetails(
            key: iosVehicleViewKey,
            vehicleID: widget.carId,
            make: widget.make,
            model: widget.model,
            year: widget.year,
            vin: widget.vin,
          )
        :
        //TODO: Convert to own page, need to refactor to match how ios is doing its CRUD
        Scaffold(
            appBar: AppBar(
              title: const Text("Car Details"),
            ),
            // body: FutureBuilder(
            //     // future: widget.car,
            //     builder: (BuildContext context, AsyncSnapshot<Car> snapshot) {
            //   Widget child;
            //   if (snapshot.hasData) {
            //     child = CarInfo(car: snapshot.data);
            //   } else if (snapshot.hasError) {
            //     child = const Text("Error populating list");
            //     debugPrint("Error populating list");
            //   } else {
            //     child = const SizedBox(
            //       width: 60,
            //       height: 60,
            //       child: CircularProgressIndicator(),
            //     );
            //   }
            //   return Container(
            //     child: child,
            //   );
            // }),
          );
  }
}
