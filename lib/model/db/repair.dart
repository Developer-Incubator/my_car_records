import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:my_car_records/model/repair.dart';

class RepairDB {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;

  void add({required String vehicleID, required Repair repair, String? owner}) {
    CollectionReference repairs =
        _firestore.collection(user!.uid).doc(vehicleID).collection('repairs');
    repairs
        .add({
          // "vehicle_id": repair.vehicleID,
          "hours": repair.hours,
          "labor": repair.labor,
          "tech": repair.tech,
          "work_requested": repair.workRequested,
        })
        .then((value) => debugPrint("Repair Added"))
        .catchError((error) => debugPrint("Failed to add repair: $error"));
  }

  Future<QuerySnapshot<Map<String, dynamic>>> get(
      {required String vehicleID}) async {
    return await _firestore
        .collection(user!.uid)
        .doc(vehicleID)
        .collection('repairs')
        // .where("vehicle_id", isEqualTo: vehicleID)
        .get()
        .then((value) {
      return value;
    });
  }
  // Future<QuerySnapshot<Map<String, dynamic>>> get({vehicleID}) async {
  //   return await _firestore
  //       .collection('repairs')
  //       .where("vehicle_id", isEqualTo: vehicleID)
  //       .get()
  //       .then((value) {
  //     return value;
  //   });
  // }

  void delete(String vehicleID, String repairId) {
    _firestore
        .collection(user!.uid)
        .doc(vehicleID)
        .collection("repairs")
        .doc(repairId)
        .delete()
        .then((value) => debugPrint("Deleted car"))
        .catchError((error) => debugPrint(error));
  }
}
