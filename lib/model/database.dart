import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

import 'Car.dart';

Future<List> getCars() async {
  final cars = await FirebaseDatabase.instance.ref().child("cars").get();
  var testArr = [];

  if (cars.exists) {
    cars.children.forEach((element) {
      String vin = element.key.toString();
      int year = int.parse(element.child("year").value.toString());
      String make = element.child("make").value.toString();
      String model = element.child("model").value.toString();
      String owner = element.child("owner").value.toString();
      testArr.add(Car(vin, year, make, model, owner));
    });
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

Future<List> getACar(String vin) async {
  final car = await FirebaseDatabase.instance.ref().child("cars/$vin").get();
  final repairs =
      await FirebaseDatabase.instance.ref().child("Repairs/$vin").get();
  var cardata = [];

  if (car.exists) {
    String vin = car.key.toString();
    int year = int.parse(car.child("year").value.toString());
    String make = car.child("make").value.toString();
    String model = car.child("model").value.toString();
    String owner = car.child("owner").value.toString();
    var myCar = Car(vin, year, make, model, owner);
    getCarRepairs(vin);
    // print(repairs.child("01").child("hours").value);
    cardata.add(myCar);
  }
  return cardata;
}

getCarRepairs(vin) async {
  final repairs =
      await FirebaseDatabase.instance.ref().child("Repairs/$vin").get();
  var repairArr = [];
  if (repairs.exists) {
    repairs.children.forEach((repair) {
      print(repair.value);
    });
  }

  // return repairArr;
}
