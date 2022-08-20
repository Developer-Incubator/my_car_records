import 'package:flutter/material.dart';
import 'package:my_car_records/views/CarDetails.dart';

/// showAllCars
///
/// @param carList list of all cars as Car objects
///
/// @param context used to go back to the previous page
///
/// @return List<Widget> cars
///
/// @description loops throught the list of cars, creates a card widget with the cars information and adds it to the cars array
///

List<Widget> showAllCars(carList, context) {
  List<Widget> cars = [];
  for (var car in carList.data) {
    var carData = car.getInfo();
    String vin = carData['vin'];
    cars.add(
      Card(
        child: ListTile(
          leading: const Icon(Icons.directions_car_filled),
          title:
              Text("${carData['year']} ${carData['make']} ${carData['model']}"),
          subtitle: Text(vin),
          trailing: IconButton(
            onPressed: () {
              print('words');
            },
            icon: const Icon(Icons.more_vert),
          ),

          /// sends user back to the car information page
          onTap: (() {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => CarDetailsPage(
                      vin: vin,
                    )));
          }),
        ),
      ),
    );
  }
  return cars;
}
