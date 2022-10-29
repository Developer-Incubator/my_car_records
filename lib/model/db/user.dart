import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class DbUser {
  final user = FirebaseAuth.instance.currentUser;
  addUser(String name) {
    DatabaseReference db = FirebaseDatabase.instance.ref().child(user!.uid).child("info");
    db.set({
      "name": name

    });
  }
}
