import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAPIServices {
  Future<String> createUserWithEmail({String email, String password}) async {
    try {
      UserCredential _userCred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.toString().trim(),
              password: password.toString().trim());

      return 'success';
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return 'The account already exists for that email';
      } else {
        print("Exception while creating user:" + e.message);
      }
    } catch (e) {
      print("Error while creating user:" + e);
      return e.toString();
    }
  }

  Future<String> signInWithEmail({String email, String password}) async {
    try {
      UserCredential _userCred = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return 'success';
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        print('Email/Password wrong.');
        return 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return 'Email/Password wrong.';
      }
    }
  }

  Future<String> signOut() async {
    await FirebaseAuth.instance.signOut();
    return 'success';
  }
}
