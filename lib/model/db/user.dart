import 'dart:convert';
import 'dart:developer';

import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:my_car_records/utils/sharedprefs.dart';

class DBUser {
  static Future<User> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      var res = await http.Client().post(
        Uri.parse(loginURL),
        body: jsonEncode(
          {"email": email, "password": password},
        ),
      );
      Map<String, dynamic> info = json.decode(res.body);
      return User.fromJson(info['message']);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<bool> loginWithToken() async {
    try {
      User user = User.fromString(SharedPrefs.prefs!.getString('user')!);
      http.Response res = await http.post(
        Uri.parse(loginWithTokenURL),
        body: jsonEncode(
          {'id': user.id, 'session_token': user.sessionToken},
        ),
      );
      if (jsonDecode(res.body)['error'] == null) {
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<void> logout(User user) async {
    await http.put(Uri.parse("$urlfront/user/${user.id}"));
    user.sessionToken = '';
    SharedPrefs.saveUser(user);
  }
}
