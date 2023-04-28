import 'package:flutter/cupertino.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/controllers/signin.dart';
import 'package:my_car_records/model/db/user.dart';
import 'package:my_car_records/model/user.dart';
import 'package:my_car_records/utils/sharedprefs.dart';

class IOSLogin extends StatelessWidget {
  const IOSLogin(
      {super.key,
      required this.email,
      required this.password,
      required this.signInWithAppleButton});
  final TextEditingController email;
  final TextEditingController password;
  final Widget signInWithAppleButton;

  @override
  Widget build(BuildContext context) {
    email.text = 'test@mail.com';
    password.text = 'test';
    // FirebaseAuth auth = FirebaseAuth.instance;
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Login'),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoTextField(
            placeholder: "Email",
            controller: email,
          ),
          CupertinoTextField(
            placeholder: "Password",
            controller: password,
          ),
          CupertinoButton.filled(
              child: const Text("Submit"),
              onPressed: () async {
                User? user = await DBUser.loginWithEmailAndPassword(
                    email.text, password.text);
                if (user != null) {
                  SharedPrefs.prefs!.setString("user", user.toString());

                  Navigator.popAndPushNamed(
                      navKey.currentContext!, "/dashboard");
                }
              }),
          CupertinoButton(
              onPressed: (() {
                signInWithGoogle();
              }),
              child: const Text("Sign in with Google")),
          signInWithAppleButton,
          CupertinoButton(
              child: const Text("Register"),
              onPressed: () {
                Navigator.pushNamed(context, "/register");
              })
        ],
      ),
    );
  }
}
