<<<<<<< Updated upstream
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [],
      )),
=======
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_car_records/model/db/user.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Name"),
            TextFormField(controller: name),
            const Text("Email"),
            TextFormField(controller: email),
            const Text("Password"),
            TextFormField(controller: password),
            ElevatedButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email.text, password: password.text);
                    DbUser().addUser(name.text);
                  } catch (e) {
                    print(e);
                  }
                  await Future.delayed(const Duration(seconds: 1), () {
                    Navigator.pop(context);
                  });
                },
                child: const Text("Submit"))
          ],
        ),
      ),
>>>>>>> Stashed changes
    );
  }
}
