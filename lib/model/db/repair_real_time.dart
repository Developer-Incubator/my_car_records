import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
// import 'package:my_car_records/model/db/part.dart';

import 'package:my_car_records/model/part.dart';
import 'package:my_car_records/model/repair.dart';

import 'package:uuid/uuid.dart';

// Create

/// Adds a repair to the database. Creates a random UUID and sets data to the inputed information
///
/// [vin] vehicle id number
/// [hours] total number of hours to complete the repair
/// [odometer] total miles that are on the car of time of repair
/// [tech] name of the technition that performed repairs
void addRepair(String vin, double hours, double labor, String odometer,
    String tech, String workRequested) {
  Uuid uuid = const Uuid();
  DatabaseReference repairsRef = FirebaseDatabase.instance
      .ref()
      .child("Repairs")
      .child(vin)
      .child(uuid.v4());
  repairsRef.set(
    {
      "hours": hours,
      "labor": labor,
      "odometer": odometer,
      "technition": tech,
      "workRequested": workRequested
    },
  );
}

// Read

/// gets all repairs for a vehicle using the [vin]
// ///
// /// [vin] vehicle id number.
// Future<List> getCarRepairs(vin) async {
//   DataSnapshot repairs =
//       await FirebaseDatabase.instance.ref().child("Repairs/$vin").get();
//   List<Repair> repairArr = [];
//   // Validation
//   if (repairs.exists) {
//     for (DataSnapshot repair in repairs.children) {
//       List<Part> partsList = [];
//       // gets information from DB
//       String name = repair.key.toString();
//       double hours = double.parse(repair.child("hours").value.toString());
//       double labor = double.parse(repair.child("labor").value.toString());

//       String odometer = repair.child("odometer").value.toString();
//       String tech = repair.child("technition").value.toString();
//       String workRequested = repair.child("workRequested").value.toString();

//       Repair myRepair =
//           Repair(name, hours, labor, tech, odometer, workRequested, partsList);
//       // print(myRepair.getRepairInfo());
//       repairArr.add(myRepair);
//     }
//   } else {
//     debugPrint('no repairs');
//   }

//   return repairArr;
// }

/// gets a spcific repair baised on its id. creates a list to easily return the desired repair
///
/// [vin] vehicle id number.
/// [repairId] id associated with the desired repair
// Future<Repair> getARepair({required String vin, required repairId}) async {
//   DataSnapshot repair = await FirebaseDatabase.instance
//       .ref()
//       .child("Repairs/$vin/$repairId")
//       .get();
//   DataSnapshot parts = await FirebaseDatabase.instance
//       .ref()
//       .child("Repairs/$vin/$repairId/parts")
//       .get();

// // getting all the parts
//   List<Part> partsList = [];
//   for (DataSnapshot part in parts.children) {
//     String id = part.key.toString();
//     String name = part.child("name").value.toString();
//     int quantity = int.parse(part.child("quantity").value.toString());
//     double unitPrice = double.parse(part.child("unitPrice").value.toString());
//     partsList.add(Part(id, name, quantity, unitPrice));
//   }

//   double hours = double.parse(repair.child("hours").value.toString());
//   double labor = double.parse(repair.child("labor").value.toString());
//   String tech = repair.child("technition").value.toString();
//   String odometer = repair.child("odometer").value.toString();
//   String requested = repair.child("workRequested").value.toString();

//   // Repair carRepair =
//   //     Repair(repairId, hours, labor, tech, odometer, requested, partsList);

//   return carRepair;
// }

// update

/// will update a repair in the db with new information
///
/// [vin] veicle Id
/// [repairId] id associated with the repair
/// [hours] naoput of time to complete the repair
/// [tech] name of the technition that is performing repairs
/// [odometer] miles on vehicle at time of repair
/// [workRequested] work asked to be done by the customer
void updateRepair(String vin, String repairId, double hours, String tech,
    String odometer, String workRequested) async {
  DatabaseReference repairToUpdate =
      FirebaseDatabase.instance.ref().child("Repairs/$vin").child(repairId);

  Map<String, dynamic> repairData = {
    'hours': hours,
    'technition': tech,
    'odometer': odometer,
    "workRequested": workRequested
  };

  repairToUpdate.update(repairData);
}

// Delete

/// removes a repair from the db.
///
/// [vin] vehicle id number.
/// [repairId] id associated wit hthe repair that is desired to be deleted
void deleteRepair(String vin, String repairId) {
  FirebaseDatabase.instance.ref().child("Repairs/$vin/$repairId").remove();
}
