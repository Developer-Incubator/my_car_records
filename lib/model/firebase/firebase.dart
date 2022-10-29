import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class MyFirebase {
  FirebaseDatabase db = FirebaseDatabase.instance;

  User? user = FirebaseAuth.instance.currentUser;

  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  late NotificationSettings messageSettings;
  late String? token;
  init() async {
    messageSettings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    token = await messaging.getToken(
        vapidKey:
            "BJTrTXF-DVccVGCnDLY4qqtGi23872-A_mwQAExX27o2o3NF45vrTMbOZlmrl4Yu36PVJggxJzII8L02IFeUepU");
  }
}
