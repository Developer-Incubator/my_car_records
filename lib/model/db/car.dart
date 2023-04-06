import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:my_car_records/controllers/my_extensions.dart';
import 'package:my_car_records/model/car.dart';

class CarDB {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;

  void add(Vehicle? vehicle, {String? owner}) {
    if (vehicle != null) {
      CollectionReference cars = _firestore.collection("cars");
      cars
          .add({
            "user_id": user!.uid,
            "vin": vehicle.vin,
            "make": capitalize(vehicle.make!),
            "model": vehicle.model,
            "year": vehicle.modelYear,
            "owner": owner
          })
          .then((value) => debugPrint("Car Added"))
          .catchError((error) => debugPrint("Failed to add car: $error"));
    } else {
      debugPrint("vehicle was not provided");
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> get() async {
    return await _firestore
        .collection('cars')
        .where("user_id", isEqualTo: user!.uid)
        .get()
        .then((value) {
      return value;
    });
  }

  void delete(String carId) {
    _firestore
        .collection("cars")
        .doc(carId)
        .delete()
        .then((value) => print("Deleted car"))
        .catchError((error) => print(error));
  }
}
