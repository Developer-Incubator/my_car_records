import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_car_records/constance/constance.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  );
                  Navigator.pop(navKey.currentContext!);
                  Navigator.pushReplacementNamed(
                      navKey.currentContext!, "/dashboard");
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    //TODO: Inform user that there password is too weak
                    debugPrint('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    //TODO: Inform user that the email is already in use
                    debugPrint('The account already exists for that email.');
                  } else {
                    //TODO: research into the different error codes that can come back from firebase
                    debugPrint(e.code);
                  }
                } catch (e) {
                  debugPrint(e.toString());
                }
              })
        ],
      ),
    );
  }
}
