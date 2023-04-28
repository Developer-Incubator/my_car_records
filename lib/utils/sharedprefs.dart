import 'package:my_car_records/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? prefs;

  static Future<void> initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  static User? getUser() {
    String? userString = prefs!.getString('user');
    if (userString == null) {
      return null;
    }

    return User.fromString(userString);
  }

  static void saveUser(User user) {
    prefs!.setString("user", user.toString());
  }
}
