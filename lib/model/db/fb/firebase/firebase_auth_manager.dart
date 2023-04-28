import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthManager {
  final FirebaseAuth auth;
  FirebaseAuthManager({required this.auth});
  Future<UserCredential?> signup(String email, String password) async {
    try {
      UserCredential credentials = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credentials;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Sign up with email and password
  Future<void> signUpWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User created successfully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<UserCredential?> signinWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credentials = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credentials;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<String> signout() async {
    try {
      await auth.signOut();
      return "success";
    } catch (e) {
      rethrow;
    }
  }
}
