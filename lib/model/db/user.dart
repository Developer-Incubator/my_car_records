import 'dart:convert';
import 'dart:developer';

import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:my_car_records/utils/sharedprefs.dart';

class DBUser {
  final http.Client client;
  DBUser(this.client);
  Future<User?> register(String email, String password,
      {String? username, String? firstName, String? lastName}) async {
    var res = await client.post(
      Uri.parse("$urlfront/user/signup"),
      body: jsonEncode(
        {
          "userInfo": {
            "email": email,
            "password": password,
            "username": username,
            "firstName": firstName,
            "lastName": lastName,
          }
        },
      ),
    );

    Map<String, dynamic> data = jsonDecode(res.body);
    if (data["error"] != null) {
      log(data["error"]);
      throw Exception(data["error"]);
    }
    return User.fromJson(data["message"]);
  }

  Future<User> loginWithEmailAndPassword(String email, String password) async {
    try {
      var res = await client.post(
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

  Future<bool> loginWithToken() async {
    try {
      User user = User.fromString(SharedPrefs.prefs!.getString('user')!);
      http.Response res = await client.post(
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

  Future<void> logout(User user) async {
    await client.put(Uri.parse("$urlfront/user/${user.id}"));
    user.sessionToken = '';
    SharedPrefs.saveUser(user);
  }
}
