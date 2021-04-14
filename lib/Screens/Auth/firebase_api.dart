import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAPIServices {
  Future<String> createUserWithEmail({String email, String password}) async {
    try {
      UserCredential _userCred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return 'success';
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return 'The account already exists for that email';
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String> signInWithEmail({String email, String password}) async {
    try {
      UserCredential _userCred = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return 'success';
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return 'Wrong password provided for that user';
      }
    }
  }
}
