import 'package:flutter/widgets.dart';
import 'package:my_car_records/views/repair/repair_info.dart';
import 'package:my_car_records/views/vehicle/vehicle_details.dart';
import 'package:my_car_records/views/home/home_screen.dart';
import 'package:my_car_records/views/login/login.dart';
import 'package:my_car_records/views/profile.dart';
import 'package:my_car_records/views/register.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "/login": (context) => const LoginPage(),
  "/register": (context) => const RegisterPage(),
  "/profile": (context) => const ProfilePage(),
  "/dashboard": (context) => const MyHomePage(),
  "/carDetails": (context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return CarDetailsPage(
      vehicle: args["vehicle"]!,
      user: args["user"],
      firestore: args["firestore"],
    );
  },
  "/repairDetails": (context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return RepairInfo(vehicleID: args["vehicleID"], repair: args["repair"]!);
  }
};
