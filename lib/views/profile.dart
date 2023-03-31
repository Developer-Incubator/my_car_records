import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_car_records/constance/constance.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text("Profile"),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton.filled(
                    child: const Text("Sign Out"),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(navKey.currentContext!)
                          .popUntil((route) => route.isFirst);
                      Navigator.of(navKey.currentContext!)
                          .pushReplacementNamed("/login");
                      // Navigator.pop(navKey.currentContext!);
                      // Navigator.pushReplacementNamed(
                      //     navKey.currentContext!, "/login");
                    }),
              ],
            ),
          ),
        ));
  }
}
