import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_car_records/model/vehicle.dart';

class VinDecoder {
  final http.Client client;
  VinDecoder(this.client);

  // https://vpic.nhtsa.dot.gov/api/vehicles/decodevinextended/2CNFLEEW5A6267165?format=json

  final String urlFront =
      "https://vpic.nhtsa.dot.gov/api/vehicles/decodevinvalues/";
  final String urlRear = "?format=json";

  Future<Vehicle?> decodeVin(String? vin) async {
    try {
      Uri uri = Uri.parse("$urlFront$vin$urlRear");
      http.Response res = await client.get(uri);
      Map<String, dynamic> vehicleInfo = jsonDecode(res.body);

      return Vehicle.fromJson(vehicleInfo["Results"][0]);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
