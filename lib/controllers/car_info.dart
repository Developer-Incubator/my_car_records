import 'package:flutter/material.dart';
import 'package:my_car_records/controllers/all_repairs.dart';
import 'package:my_car_records/model/database.dart';
import 'package:my_car_records/views/repair_form.dart';

/// displays all the information about a single car
///
/// @param car Array holds all the car information and matinance records
/// 
class CarInfo extends StatefulWidget {
  final car;

  const CarInfo({Key? key, required this.car}) : super(key: key);

  @override
  State<CarInfo> createState() => _CarInfoState();
}

class _CarInfoState extends State<CarInfo> {
  @override
  Widget build(BuildContext context) {
     var carInfo = widget.car[0].getInfo();
    var repairs = getCarRepairs(carInfo["vin"]);
     return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Row(
            children: [
              const Text(
                "VIN: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(carInfo['vin']),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Row(
            children: [
              const Text(
                "Year: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(carInfo['year'].toString()),
              ),
              const Text(
                "Make: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(carInfo['make']),
              ),
              const Text(
                "Model: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(carInfo['model']),
              ),
              //
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const Text("Repairs"),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) =>  RepairForm(vin: carInfo['vin'],))).then((value) => setState((){}));
                  },
                  child: const Icon(Icons.add))
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: repairs,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                children = showAllRepairs(carInfo['vin'],snapshot, context);
              } else if (snapshot.hasError) {
                children = [];
                debugPrint("Error populating repairs");
              } else {
                children = const <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(),
                  ),
                ];
              }
              return ListView(
                children: children,
              );
            },
          ),
        )
      ],
    );
  }
}
