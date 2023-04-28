import 'dart:convert';

import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/model/user.dart';
import 'package:my_car_records/model/vehicle.dart';
import 'package:http/http.dart' as http;
import 'package:my_car_records/utils/sharedprefs.dart';

class DBVehicle {
  static final User? _user = SharedPrefs.getUser();
  static Future<List<Vehicle>> getVehicles() async {
    try {
      http.Response res = await http.get(
          Uri.parse("$urlfront/vehicle/${_user!.id}/${_user!.sessionToken}"));

      Map<String, dynamic> info = jsonDecode(res.body);

      if (info["error"] == null) {
        List data = info["message"];
        List<Vehicle> vehicleList = List.generate(data.length, (index) {
          return Vehicle(
              make: data[index]['make'],
              model: data[index]['model'],
              modelYear: data[index]['model_year'],
              vin: data[index]['vin']);
        });
        return vehicleList;
      }
      return [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
