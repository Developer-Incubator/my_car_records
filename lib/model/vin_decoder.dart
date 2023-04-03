import 'dart:convert';

import 'package:http/http.dart' as http;

class VinDecoder {
  // https://vpic.nhtsa.dot.gov/api/vehicles/decodevinextended/2CNFLEEW5A6267165?format=json
  final String _urlFront =
      "https://vpic.nhtsa.dot.gov/api/vehicles/decodevinvalues/";
  final String _urlRear = "?format=json";

  Future<Map<String, dynamic>?> decodeVin(String vin) async {
    try {
      Uri uri = Uri.parse("$_urlFront$vin$_urlRear");
      http.Response res = await http.get(uri);
      Map<String, dynamic> vehicleInfo = jsonDecode(res.body);

      return vehicleInfo["Results"][0];
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
