import 'package:flutter/material.dart';

/// displays all the information about a single car
/// 
/// @param car Array holds all the car information and matinance records 
class CarInfo extends StatelessWidget {
  const CarInfo({Key? key, required this.car}) : super(key: key);
  final car;

  @override
  Widget build(BuildContext context) {
    var carInfo = car[0].getInfo();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16,8,16,8),
          child: Row(
            children: [
              const Text("VIN: ", 
                style: TextStyle(
                fontWeight: FontWeight.bold
                ),),
              Text(carInfo['vin']),
            ],
          ),
        ),
         Padding(
           padding: const EdgeInsets.fromLTRB(16,8,16,8),
           child: Row(
             children: [
               const Text("Year: ", 
                style: TextStyle(
                fontWeight: FontWeight.bold
                ),
                ),
               Padding(
                 padding: const EdgeInsets.only(right: 8),
                 child: Text(carInfo['year'].toString()),
               ),
               const Text("Make: ", 
                style: TextStyle(
                fontWeight: FontWeight.bold
                ),),
              Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: Text(carInfo['make']),
              ), 
               const Text("Model: " ,
               style: TextStyle(
                fontWeight: FontWeight.bold
                ),
                ),
              Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: Text(carInfo['model']),
              ),
              
             ],
           ),
         ),

        //  FutureBuilder(builder: builder)     
              
      ],
    );
  }
}
