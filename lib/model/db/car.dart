import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:my_car_records/controllers/my_extensions.dart';
import 'package:my_car_records/model/vehicle.dart';

class CarDB {
  final FirebaseFirestore firestore;
  final User user;
  CarDB({required this.firestore, required this.user});

  Future<DocumentReference> add(Vehicle? vehicle, {String? owner}) async {
    if (vehicle != null) {
      CollectionReference cars = firestore.collection(user.uid);

      return await cars.add({
        "VIN": vehicle.vin,
        "Make": capitalize(vehicle.make),
        "Model": vehicle.model,
        "ModelYear": vehicle.modelYear,
        "owner": owner
      }).whenComplete(() => debugPrint("Vehicle added successfully"));
    } else {
      throw Exception("vehicle was not provided");
    }
  }

  Future<List<Vehicle>> get() async {
    try {
      List<Vehicle> vehicles =
          await firestore.collection(user.uid).get().then((value) {
        List<Vehicle> vehicleList = [];
        for (var vehicle in value.docs) {
          Map<String, dynamic> vehicleInfo = vehicle.data();
          Map<String, dynamic> json = {
            "id": vehicle.id,
            "VIN": vehicleInfo["VIN"],
            "Make": vehicleInfo["Make"],
            "Model": vehicleInfo["Model"],
            "ModelYear": vehicleInfo["ModelYear"],
          };
          vehicleList.add(Vehicle.fromJson(json, firestore: firestore));
          // print(Vehicle.fromJson(item.data()));
        }

        return vehicleList;
      });

      return vehicles;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void delete(String carId) {
    firestore
        .collection("cars")
        .doc(carId)
        .delete()
        .then((value) => debugPrint("Deleted car"))
        .catchError((error) => debugPrint(error));
  }
}
