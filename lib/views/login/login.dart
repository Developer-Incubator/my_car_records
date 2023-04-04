import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/controllers/signin.dart';
import 'package:my_car_records/views/login/ios_login.dart';
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

  Widget signinwithAppleButton = SignInWithAppleButton(
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
