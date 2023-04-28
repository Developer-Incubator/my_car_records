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

  Future<List<Repair>> get({required String vehicleID}) async {
    dynamic repairs = await _firestore
        .collection(user!.uid)
        .doc(vehicleID)
        .collection('repairs')
        // .where("vehicle_id", isEqualTo: vehicleID)
        .get()
        .then((value) {
      List<Repair> repairList = [];
      for (var repair in value.docs) {
        Map<String, dynamic> repairInfo = repair.data();
        Map<String, dynamic> json = {
          "id": repair.id,
          "vehicleID": vehicleID,
          "work_requested": repairInfo["work_requested"],
          "tech": repairInfo["tech"],
          "hours": repairInfo["hours"],
          "labor": repairInfo["labor"]
        };
        repairList.add(Repair.fromJson(json));
      }

      return repairList;
    });
    return repairs;
  }

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
