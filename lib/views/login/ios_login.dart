import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/controllers/signin.dart';
import 'package:my_car_records/model/db/firebase/firebase_auth_manager.dart';

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
    FirebaseAuth auth = FirebaseAuth.instance;
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
                UserCredential? credential =
                    await FirebaseAuthManager(auth: auth)
                        .signinWithEmailAndPassword(email.text, password.text);
                if (credential != null) {
                  Navigator.pushReplacementNamed(
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
