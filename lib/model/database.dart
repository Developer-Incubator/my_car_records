import 'package:firebase_database/firebase_database.dart';
import 'package:my_car_records/model/repair.dart';

import 'package:uuid/uuid.dart';

import 'car.dart';

/// gets all the cars from the database and returns them in an array
Future<List> getCars() async {
  final cars = await FirebaseDatabase.instance.ref().child("cars").get();
  var testArr = [];

  if (cars.exists) {
    for (var element in cars.children) {
      String vin = element.key.toString();
      int year = int.parse(element.child("year").value.toString());
      String make = element.child("make").value.toString();
      String model = element.child("model").value.toString();
      String owner = element.child("owner").value.toString();
      testArr.add(Car(vin, year, make, model, owner));
    }
  } else {
    print("No Cars");
  }

  return testArr;
}

// add a car to the database
// @param String vin vehicle id number
addCar(String vin, int year, make, String model, String ownerUsername) {
  DatabaseReference _testRef =
      FirebaseDatabase.instance.ref().child("cars").child(vin);
  _testRef.set({
    "make": make,
    "model": model,
    "year": year,
    "owner": ownerUsername,
  });
}

/// gets a single car from the database
//
// @param vin String id of car unique db identifier
Future<List> getACar(String vin) async {
  final car = await FirebaseDatabase.instance.ref().child("cars/$vin").get();

  var cardata = [];

  if (car.exists) {
    String vin = car.key.toString();
    int year = int.parse(car.child("year").value.toString());
    String make = car.child("make").value.toString();
    String model = car.child("model").value.toString();
    String owner = car.child("owner").value.toString();
    var myCar = Car(vin, year, make, model, owner);

    cardata.add(myCar);
  }
  return cardata;
}

// Start Repairs

/// gets all repairs for a vehicle using the vin
Future<List> getCarRepairs(vin) async {
  final repairs =
      await FirebaseDatabase.instance.ref().child("Repairs/$vin").get();
  var repairArr = [];
  // Validation
  if (repairs.exists) {
    for (var repair in repairs.children) {
      List<Part> partsList = [];
      // gets information from DB
      String name = repair.key.toString();
      double hours = double.parse(repair.child("hours").value.toString());
      String odometer = repair.child("odometer").value.toString();
      String tech = repair.child("technition").value.toString();
      String workRequested = repair.child("workRequested").value.toString();

      // loops through each part and creates a Part class for each
      for (var part in repair.child("parts").children) {
        String name = part.key.toString();
        double unitPrice =
            double.parse(part.child('unitPrice').value.toString());
        int quantity = int.parse(part.child('quantity').value.toString());
        Part myPart = Part(name, quantity, unitPrice);
        // adds part to
        partsList.add(myPart);
      }
      Repair myRepair =
          Repair(name, hours, tech, odometer, workRequested, partsList);
      // print(myRepair.getRepairInfo());
      repairArr.add(myRepair);
    }
  } else {
    print('no repairs');
  }

  return repairArr;
}

Future<List> getARepair({required String vin, required repairId}) async {
  final repair = await FirebaseDatabase.instance
      .ref()
      .child("Repairs/$vin/$repairId")
      .get();
  var repairData = [];
  List<Part> partsList = [];
  if (repair.exists) {
    double hours = double.parse(repair.child("hours").value.toString());
    String tech = repair.child("technition").value.toString();
    String odometer = repair.child("odometer").value.toString();
    String requested = repair.child("workRequested").value.toString();

    // loops and maks Parts with the data from the the indivitual parts on the repair or
    for (var part in repair.child("parts").children) {
      String name = part.key.toString();
      double unitPrice = double.parse(part.child('unitPrice').value.toString());
      int quantity = int.parse(part.child('quantity').value.toString());
      Part myPart = Part(name, quantity, unitPrice);
      // adds part to
      partsList.add(myPart);
    }
    Repair carRepair =
        Repair(repairId, hours, tech, odometer, requested, partsList);
    print(carRepair.getRepairInfo());
    repairData.add(carRepair);
    return repairData;
  }
  return repairData;
}

addRepair(String vin, double hours, String odometer, String tech,
    String workRequested) {
  var uuid = const Uuid();
  DatabaseReference repairsRef = FirebaseDatabase.instance
      .ref()
      .child("Repairs")
      .child(vin)
      .child(uuid.v4());
  repairsRef.set(
    {
      "hours": hours,
      "odometer": odometer,
      "technition": tech,
      "workRequested": workRequested
    },
  );
}

// Future<List> getRepairParts() async{
//   List<Part> partsList = [];
//   final repair = await FirebaseDatabase.instance.ref().child("cars/$vin").get();
//   return partsList;
// }
