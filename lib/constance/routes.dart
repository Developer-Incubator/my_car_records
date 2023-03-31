import 'package:flutter/widgets.dart';
import 'package:my_car_records/views/home_screen.dart';
import 'package:my_car_records/views/login/login.dart';
import 'package:my_car_records/views/profile.dart';
import 'package:my_car_records/views/register.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "/login": (context) => const LoginPage(),
  "/register": (context) => const RegisterPage(),
  "/dashboard": (context) {
    return const MyHomePage();
  },
  "/profile": (context) => const ProfilePage(),
};
