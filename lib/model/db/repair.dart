import 'dart:convert';

import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/model/part.dart';
import 'package:my_car_records/model/repair.dart';
import 'package:http/http.dart' as http;
import 'package:my_car_records/model/user.dart';
import 'package:my_car_records/utils/sharedprefs.dart';

class DBRepair {
  static final User? _user = SharedPrefs.getUser();
  static Future<bool> add(Repair repair) async {
    await http.Client().post(
      Uri.parse("$urlfront/repair/add"),
      body: jsonEncode(
        {
          "userInfo": {"id": _user!.id, "sessionToken": _user!.sessionToken},
          "repairInfo": repair.getRepairInfo()
        },
      ),
    );
    return false;
  }

  static Future<List<Repair>> getAll(int vehicleId) async {
    var res = await http.Client().get(Uri.parse(
        "$urlfront/repair/${_user!.id}/${_user!.sessionToken}/$vehicleId"));

    Map<String, dynamic> data = jsonDecode(res.body);
    if (data["error"] != null) {
      return [];
    }

    return List<Repair>.generate(data["message"].length, (index) {
      return Repair.fromJson(data["message"][index]);
    });
  }

  static Future<bool> delete(int repairId) async {
    var res = await http.delete(Uri.parse(
        "$urlfront/repair/delete/${_user!.id}/${_user!.sessionToken}/$repairId"));
    Map<String, dynamic> data = jsonDecode(res.body);
    if (data['error'] == null) {
      return false;
    }
    return true;
  }

  static Future<bool> addPart(Part part) async {
    var res = await http.post(
      Uri.parse("$urlfront/part"),
      body: jsonEncode(
        {
          "userInfo": {"id": _user!.id, "sessionToken": _user!.sessionToken}
        },
      ),
    );
    return false;
  }

  static Future<double> getTotal(int repairId) async {
    var res = await http.get(Uri.parse(
        "$urlfront/part/total/${_user!.id}/${_user!.sessionToken}/$repairId"));
    Map<String, dynamic> data = jsonDecode(res.body);

    return double.tryParse(data['message']["total"] ?? "0") ?? 0.00;
  }
}
