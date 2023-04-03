import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
// import 'package:my_car_records/controllers/my_extensions.dart';
import 'package:my_car_records/model/car.dart';

// Create
/// add a car to the database
/// [vin] vehicle id number.
/// [year] the vehicle was produced.
/// [make] manufacture of the vehicle
/// [model] product of the manufacturer
/// [ownerUsername] the name of the cars owner
void addCar(
    String vin, int year, String make, String model, String ownerUsername) {
  DatabaseReference db =
      FirebaseDatabase.instance.ref().child("cars").child(vin.toUpperCase());
  db.set({
    "make": make,
    "model": model,
    "year": year,
    "owner": ownerUsername,
  });
}



// Read
/// gets all the cars from the database and returns them in an array as a Car object
Future<List> getCars() async {
  DataSnapshot cars = await FirebaseDatabase.instance.ref().child("cars").get();

  final List<Car> testArr = [];

  if (cars.exists) {
    for (DataSnapshot element in cars.children) {
      String vin = element.key.toString();
      int year = int.parse(element.child("year").value.toString());
      String make = element.child("make").value.toString();
      String model = element.child("model").value.toString();
      String owner = element.child("owner").value.toString();
      // testArr.add(Car(vin, year, make, model, owner));
    }
  } else {
    debugPrint("No Cars");
  }

  return testArr;
}

/// gets a single car from the database
//
/// [vin] vehicle id number.
// Future<Car> getACar(String vin) async {
  // DataSnapshot car =
  //     await FirebaseDatabase.instance.ref().child("cars/$vin").get();

  // // String vin = car.key.toString();
  // int year = int.parse(car.child("year").value.toString());
  // String make = car.child("make").value.toString();
  // String model = car.child("model").value.toString();
  // String owner = car.child("owner").value.toString();
  // Car myCar = Car(vin, year, make, model, owner);

  // return myCar;
// }

// update

/// will update a repair in the db with new information
///
/// [vin] Veicle Id.
/// [year] Year the vehicle was produced.
/// [make] Manufacturer of the vehicle .
/// [model] Product of the manufacturer.
/// [owner] Name of the owner of the vehicle.
/// [workRequested] Work asked to be done by the customer.
void updateCar(String vin, int year, String make, String model, String owner) {
  DatabaseReference carToUpdate =
      FirebaseDatabase.instance.ref().child("cars").child(vin);

  Map<String, dynamic> carData = {
    'make': make,
    'model': model,
    'year': year,
    "owner": owner,
  };
  carToUpdate.update(carData);
}

// delete
/// removes a car form the database
///
/// [vin] vehicle id number.
void deleteCar(String vin) {
  FirebaseDatabase.instance.ref().child("cars").child(vin).remove();
  FirebaseDatabase.instance.ref().child("Repairs").child(vin).remove();
}
