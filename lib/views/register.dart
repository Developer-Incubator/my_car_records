import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/model/db/user.dart';
import 'package:my_car_records/model/user.dart';
import 'package:my_car_records/utils/sharedprefs.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
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
            placeholder: "Username",
            controller: username,
          ),
          CupertinoTextField(
            placeholder: "Email",
            controller: email,
          ),
          CupertinoTextField(
            placeholder: "Password",
            controller: password,
          ),
          CupertinoTextField(
            placeholder: "Firstname",
            controller: firstName,
          ),
          CupertinoTextField(
            placeholder: "Last Name",
            controller: lastName,
          ),
          CupertinoButton.filled(
              child: const Text("Submit"),
              onPressed: () async {
                User? newUser = await DBUser(Client()).register(
                    email.text, password.text,
                    username: username.text,
                    firstName: firstName.text,
                    lastName: lastName.text);
                if (newUser != null) {
                  SharedPrefs.saveUser(newUser);
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
