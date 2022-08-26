import 'package:flutter/material.dart';
import 'package:my_car_records/controllers/car/update_car_form.dart';
import 'package:my_car_records/model/car.dart';
import 'package:my_car_records/model/db/car.dart';
import 'package:my_car_records/views/car_details.dart';

/// showAllCars
///
/// loops throught the [carList], uses the [context] to know what the last screen was, [refresh] is a function that changes the state of the parent widget. Creates a card widget with the cars information and adds it to the cars array.
///

List<Widget> showAllCars(carList, BuildContext context, Function refresh) {
  List<Widget> cars = [];
  for (Car car in carList.data) {
    
    Map<String,dynamic> carData = car.getInfo();
    String vin = carData['vin'];
    cars.add(
      Card(
        child: ListTile(
          leading: const Icon(Icons.directions_car_filled),
          title:
              Text("${carData['year']} ${carData['make']} ${carData['model']}"),
          subtitle: Text(vin),
          trailing: PopupMenuButton(
            itemBuilder: (BuildContext ctx) => [
              PopupMenuItem(
                  child: TextButton(
                      onPressed: (() {
                        deleteCar(vin);
                        refresh();
                      }),
                      child: const Text("Delete"))),
              PopupMenuItem(
                  child: TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              scrollable: true,
                              title: const Text('Car Update Form'),
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CarUpdateForm(
                                  refresh: refresh,
                                  vin: carData['vin'],
                                  year: carData['year'],
                                  make: carData['make'],
                                  model: carData['model'],
                                  owner: carData['owner'],
                                ),
                              ),
                            );
                          },
                        ).then(
                          (value) {
                            refresh();
                          },
                        );
                      },
                      child: const Text("Edit"))),
            ],
          ),

          /// sends user back to the car information page
          onTap: (() {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => CarDetailsPage(
                  vin: vin,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
  return cars;
}



// showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         scrollable: true,
//                         title: const Text('Car Form'),
//                         content: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: CarUpdateForm(
//                             refresh: refresh,
//                             vin: carData['vin'],
//                             year: carData['year'],
//                             make: carData['make'],
//                             model: carData['model'],
//                             owner: carData['owner'],
//                           ),
//                         ),
//                       );
//                     },
//                   ).then(
//                     (value) {
//                       refresh();
//                     },
//                   );