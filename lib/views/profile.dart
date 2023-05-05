import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/model/db/user.dart';
import 'package:my_car_records/utils/sharedprefs.dart';

import '../model/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User? user;

  @override
  initState() {
    super.initState();
    user = SharedPrefs.getUser();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // iosHomeKey.currentState?.dispose();
  }

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
                      await DBUser(Client()).logout(user!);

                      // await FirebaseAuth.instance.signOut();
                      Navigator.of(navKey.currentContext!)
                          .popUntil((route) => route.isFirst);

                      // Navigator.of(navKey.currentContext!)
                      //     .popAndPushNamed("/login");

                      // Navigator.pop(navKey.currentContext!);
                      Navigator.pushReplacementNamed(
                          navKey.currentContext!, "/login");
                    }),
              ],
            ),
          ),
        ));
  }
}
