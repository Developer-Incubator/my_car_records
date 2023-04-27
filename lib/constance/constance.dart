import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_car_records/views/home/ios_home.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
final GlobalKey<IOSHomePageState> iosHomeKey = GlobalKey<IOSHomePageState>();
final GlobalKey<IOSHomePageState> iosVehicleViewKey =
    GlobalKey<IOSHomePageState>();

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
