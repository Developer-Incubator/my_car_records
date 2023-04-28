import 'package:flutter/cupertino.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/controllers/signin.dart';
import 'package:my_car_records/model/db/user.dart';
import 'package:my_car_records/utils/sharedprefs.dart';
import 'package:my_car_records/views/login/ios_login.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../model/user.dart';
// import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();

    User? user = SharedPrefs.getUser();

    if (user != null && user.sessionToken.isNotEmpty) {
      // print(SharedPrefs.getUser());
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        // Navigator.pushReplacementNamed(navKey.currentContext!, "/dashboard");
        await DBUser.loginWithToken().then((value) {
          if (value == true) {
            Navigator.pushReplacementNamed(
                navKey.currentContext!, "/dashboard");
          }
        });

        // if (loggedIn) {
        //   Navigator.pushReplacementNamed(navKey.currentContext!, "/dashboard");
        // }
      });
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  Widget signinwithAppleButton = SignInWithAppleButton(
    onPressed: () async {
      try {
        // if();
        await signInWithApple();
      } catch (e) {
        debugPrint(e.toString());
      }
    },
  );

  @override
  Widget build(BuildContext context) {
    return IOSLogin(
      email: email,
      password: password,
      signInWithAppleButton: signinwithAppleButton,
    );
  }
}
