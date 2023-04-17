import 'package:firebase_database/firebase_database.dart';

import 'package:my_car_records/model/part.dart';

import 'package:uuid/uuid.dart';

// Create
/// Add a part to a repair and save it to the database
///
///Takes a [vin] and a [repairId] to get the correct repair to add a part to.
///[name] Is the name of the item to add including manufacturer.
///[qty] Is the amount of this project that is needed.
///[unitPrice] Is the amount of money it costs for a singe part
void addPart(
    String vin, String repairId, String name, int qty, double unitPrice) {
  Uuid uuid = const Uuid();
  DatabaseReference partsRef = FirebaseDatabase.instance
      .ref()
      .child("Repairs")
      .child(vin)
      .child(repairId)
      .child("parts")
      .child(uuid.v4());
  partsRef.set(
    {"name": name, "quantity": qty, "unitPrice": unitPrice},
  );
}

// Read

/// gets all the parts of a specific repair and returns them in an array as Part instances.
///
/// [vin] vehicle id that is getting the repair
/// [repairId] id of the repair with the desired parts
Future<List> getParts(String vin, String repairId) async {
  List<Part> partsList = [];

  // DataSnapshot parts = await FirebaseDatabase.instance
  //     .ref()
  //     .child("Repairs/$vin/$repairId/parts")
  //     .get();
// loops throutgh each part in the list creates insrances od parts and adds them to the partsList array
  // for (DataSnapshot part in parts.children) {
  // String id = part.key.toString();
  // String name = part.child("name").value.toString();
  // int quantity = int.parse(part.child("quantity").value.toString());
  // double unitPrice = double.parse(part.child("unitPrice").value.toString());
  // partsList.add(
  //     Part(id: id, name: name, quantity: quantity, unitPrice: unitPrice));
  // }
  return partsList;
}

/// gets a specific part from the db and creates aa Part object from the data.
///
/// [vin] vehicle id that is getting the repair,
/// [repairId] id of the repair with the desired parts,
/// [partId] unique id that is assigned to the part
///
// Future<Part> getAPart(String vin, String repairId, String partId) async {
//   DataSnapshot part = await FirebaseDatabase.instance
//       .ref()
//       .child("$vin/$repairId/$partId")
//       .get();

//   String name = part.child("name").value.toString();
//   int qty = int.parse(part.child("quantity").value.toString());
//   double price = double.parse(part.child("unitPrice").value.toString());
//   Part myPart = Part(id: partId, name: name, quantity: qty, unitPrice: price);
//   return myPart;
// }

// update

/// will update a part in the db with new information.
///
/// [vin] veicle Id,
/// [repairId] id associated with the repair.
/// [partId] id that is assigned to the part.
/// [hours] name of the part with manufacturer.
/// [qty] total number of this part needed.
/// [unitPrice] price of an individual item.
void updatePart(String vin, String repairId, String partId, String name,
    int qty, double unitPrice) async {
  DatabaseReference partToUpdate = FirebaseDatabase.instance
      .ref()
      .child("Repairs/$vin/$repairId/parts")
      .child(partId);

  Map<String, dynamic> partData = {
    'name': name,
    'price': unitPrice,
    'quantity': qty,
    "unitPrice": unitPrice
  };
  partToUpdate.update(partData);
}

/// deletePart
///
/// using the [vin] and [repairId] to dig into the database to delete a part using the [partId]
///
void deletePart(String vin, String repairId, String partId) {
  FirebaseDatabase.instance
      .ref()
      .child("Repairs/$vin/$repairId/parts/$partId")
      .remove();
}
