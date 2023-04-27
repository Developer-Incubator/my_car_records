import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:my_car_records/model/part.dart';

class PartDB {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  void add(
      {required String vehicleID,
      required String repairID,
      required Part part}) {
    CollectionReference parts = _firestore
        .collection(user!.uid)
        .doc(vehicleID)
        .collection("repairs")
        .doc(repairID)
        .collection("parts");
    parts
        .add({
          // "repair_id": part.repairID,
          "name": part.name,
          "quantity": part.quantity,
          "unit_price": part.unitPrice,
        })
        .then((value) => debugPrint("Part Added"))
        .catchError((error) => debugPrint("Failed to add part: $error"));
  }

  Future<List<Part>> get({
    String? vehicleID,
    String? repairID,
  }) async {
    return await _firestore
        .collection(user!.uid)
        .doc(vehicleID)
        .collection("repairs")
        .doc(repairID)
        .collection("parts")
        .get()
        .then((value) {
      List<Part> partsList = [];
      for (var element in value.docs) {
        Map<String, dynamic> partInfo = element.data();
        Part newPart = Part(
            id: element.id,
            name: partInfo["name"],
            quantity: partInfo["quantity"],
            unitPrice: partInfo["unit_price"]);
        partsList.add(newPart);
      }
      return partsList;
    });
  }
}
