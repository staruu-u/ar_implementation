import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireAuth {
  final _auth = FirebaseAuth.instance;
  final DatabaseReference _databaseRef =
      FirebaseDatabase.instance.ref("users/");

  Future signUp(email, password, username) async {
    String toastPhrase = "Sign Up Successful!";
    if (email.isNotEmpty & password.isNotEmpty) {
      try {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await _databaseRef.push().set({
          "email": email,
          "username": username,
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          toastPhrase = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          toastPhrase = 'The account already exists for that email.';
        }
      } catch (e) {
        toastPhrase = "Error! Please try again!";
      }
    }
    return toastPhrase;
  }

  Future logIn(username, password) async {
    String toastPhrase = "Login Successful!";
    if (username.isNotEmpty & password.isNotEmpty) {
      try {
        await _auth.signInWithEmailAndPassword(
            email: username, password: password);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          toastPhrase = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          toastPhrase = 'Wrong password provided for that user.';
        }
      }
    }
    return toastPhrase;
  }

  Future signOut() async {
    _auth.signOut();
  }

  Future googleSignIn() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    await _auth.signInWithCredential(credential);
  }
}
