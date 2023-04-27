import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/model/vehicle.dart';
import 'package:my_car_records/views/vehicle/utils/ios/ios_car_details.dart';

class CarDetailsPage extends StatefulWidget {
  const CarDetailsPage(
      {Key? key,
      required this.user,
      required this.firestore,
      required this.vehicle})
      : super(key: key);
  final Vehicle vehicle;
  final User user;
  final FirebaseFirestore firestore;
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
            vehicle: widget.vehicle,
            user: widget.user,
            firestore: widget.firestore,
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
