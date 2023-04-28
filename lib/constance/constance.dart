import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_car_records/views/home/ios_home.dart';

// Backend URLs
const String urlfront = "http://192.168.0.222:8080/api";
const String loginURL = "$urlfront/user/login";
const String loginWithTokenURL = "$urlfront/user/login_with_token";

GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> homeKey = GlobalKey<NavigatorState>();
GlobalKey<IOSHomePageState> iosHomeKey = GlobalKey<IOSHomePageState>();
GlobalKey<IOSHomePageState> iosVehicleViewKey = GlobalKey<IOSHomePageState>();

const String homePageTitle = "My Car Records";

List<CameraDescription> cameras = [];

class MyColorScheme {
  static Color blueGrey = Colors.blueGrey;
}

class WidgetColors {
  // Theme Data
  static Color primarySwatch = Colors.blueGrey;
  static Color primaryColor = Colors.blueGrey.shade600;
}
