import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/model/user.dart';
import 'package:my_car_records/model/vehicle.dart';
import 'package:my_car_records/utils/sharedprefs.dart';
import 'package:my_car_records/views/vehicle/utils/ios/ios_car_details.dart';

class CarDetailsPage extends StatefulWidget {
  const CarDetailsPage({Key? key, required this.vehicle}) : super(key: key);
  final Vehicle vehicle;

  @override
  State<CarDetailsPage> createState() => CarDetailsPageState();
}

class CarDetailsPageState extends State<CarDetailsPage> {
  @override
  Widget build(BuildContext context) {
    // widget.car = getACar(widget.vin);
    User? user = SharedPrefs.getUser();
    return Platform.isIOS
        ? IOSCarDetails(
            key: iosVehicleViewKey,
            vehicle: widget.vehicle,
            user: user!,
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
