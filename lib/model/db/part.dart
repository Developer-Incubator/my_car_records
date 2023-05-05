import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/model/part.dart';
import 'package:my_car_records/model/user.dart';
import 'package:my_car_records/utils/sharedprefs.dart';

class DBPart {
  static final User? _user = SharedPrefs.getUser();
  static Future<bool> add(Part part) async {
    var res = await http.post(
      Uri.parse("$urlfront/part/add"),
      body: jsonEncode(
        {
          "userInfo": {"id": _user!.id, "sessionToken": _user!.sessionToken},
          "partInfo": part.getPartInfo()
        },
      ),
    );
    Map<String, dynamic> data = jsonDecode(res.body);
    if (data["error"] != null) {
      throw Exception(data["error"]);
    }
    return true;
  }

  static Future<List<Part>> getAll(int repairId) async {
    var res = await http.get(Uri.parse(
        "$urlfront/part/${_user!.id}/${_user!.sessionToken}/$repairId"));
    Map<String, dynamic> data = jsonDecode(res.body);
    if (data["error"] != null) {
      throw Exception(data["error"]);
    }
    return List<Part>.generate(
      data["message"].length,
      (index) => Part.fromJson(data["message"][index]),
    );
  }
}
