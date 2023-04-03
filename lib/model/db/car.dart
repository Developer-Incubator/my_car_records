import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:my_car_records/controllers/my_extensions.dart';

class CarDB {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;

  void addCar(String? vin, String make, String model, String year,
      {String? owner}) {
    CollectionReference cars = _firestore.collection("cars");
    cars
        .add({
          "user_id": user!.uid,
          "vin": vin,
          "make": capitalize(make),
          "model": model,
          "year": year,
          "owner": owner
        })
        .then((value) => debugPrint("Car Added"))
        .catchError((error) => debugPrint("Failed to add car: $error"));
  }

  void deleteCar(String carId) {
    _firestore
        .collection("cars")
        .doc(carId)
        .delete()
        .then((value) => print("Deleted car"))
        .catchError((error) => print(error));
  }
}
