import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/model/db/firebase/firebase_auth_manager.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Register'),
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
                UserCredential? credential =
                    await FirebaseAuthManager(auth: auth)
                        .signup(email.text, password.text);

                if (credential != null) {
                  Navigator.pop(navKey.currentContext!);
                  Navigator.pushReplacementNamed(
                      navKey.currentContext!, "/dashboard");
                }
              })
        ],
      ),
    );
  }
}
