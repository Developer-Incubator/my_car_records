import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/controllers/signin.dart';

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
            placeholder: "password",
            controller: password,
          ),
          CupertinoButton.filled(
              child: const Text("Submit"),
              onPressed: () async {
                try {
                  final UserCredential credential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: email.text, password: password.text);
                  Navigator.pushReplacementNamed(
                      navKey.currentContext!, "/dashboard");
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
              }),
          CupertinoButton(
              child: Text("Sign in with Google"),
              onPressed: (() {
                signInWithGoogle();
              })),
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
