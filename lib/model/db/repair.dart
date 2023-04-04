import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:my_car_records/model/repair.dart';

class RepairDB {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void add(Repair repair, {String? owner}) {
    CollectionReference repairs = _firestore.collection("repairs");
    repairs
        .add({
          "vehicle_id": repair.vehicleID,
          "hours": repair.hours,
          "labor": repair.labor,
          "tech": repair.tech,
          "work_requested": repair.workRequested,
        })
        .then((value) => debugPrint("Car Added"))
        .catchError((error) => debugPrint("Failed to add car: $error"));
  }

  Future<QuerySnapshot<Map<String, dynamic>>> get(vehicleID) async {
    return await _firestore
        .collection('repairs')
        .where("vehicle_id", isEqualTo: vehicleID)
        .get()
        .then((value) {
      return value;
    });
  }

  void delete(String repairId) {
    _firestore
        .collection("repairs")
        .doc(repairId)
        .delete()
        .then((value) => print("Deleted car"))
        .catchError((error) => print(error));
  }
}
