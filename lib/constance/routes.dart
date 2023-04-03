import 'package:flutter/widgets.dart';
import 'package:my_car_records/views/car_details/ios_car_details.dart';
import 'package:my_car_records/views/home_screen.dart';
import 'package:my_car_records/views/login/login.dart';
import 'package:my_car_records/views/profile.dart';
import 'package:my_car_records/views/register.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "/login": (context) => const LoginPage(),
  "/register": (context) => const RegisterPage(),
  "/profile": (context) => const ProfilePage(),
  "/dashboard": (context) => const MyHomePage(),
  "/iosCarDetails": (context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return IOSCarDetails(
      carId: args["carId"]!,
      make: args["make"]!,
      model: args["model"]!,
      year: args["year"]!,
    );
  },
};
