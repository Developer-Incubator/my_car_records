import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/controllers/signin.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        Navigator.pushReplacementNamed(context, "/dashboard");
        print('User is signed in!');
      }
    });
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

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
                try {
                  signInWithGoogle();
                } catch (e) {
                  debugPrint(e.toString());
                }
              })),
          SignInWithAppleButton(
            onPressed: () async {
              try {
                // if();
                UserCredential? user = await signInWithApple();
                print(user);
              } catch (e) {
                debugPrint(e.toString());
              }

              // Now send the credential (especially `credential.authorizationCode`) to your server to create a session
              // after they have been validated with Apple (see `Integration` section for more information on how to do this)
            },
          ),
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
