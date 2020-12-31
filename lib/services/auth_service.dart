import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> get userStream => _auth.authStateChanges();

  Future<UserCredential> login({String email, String password}) async {
    UserCredential userCredential;
    try {
      userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw 'The email is invalid.';
      } else if (e.code == 'user-not-found') {
        throw 'No account created for this email.';
      } else if (e.code == 'wrong-password') {
        throw 'The password is incorrect. ';
      } else {
        throw e.message;
      }
    }
    return userCredential;
  }

  Future<UserCredential> signUp({String email, String password}) async {
    UserCredential userCredential;
    try {
      userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw 'The email is invalid.';
      } else if (e.code == 'weak-password') {
        throw 'The password is too weak.';
      } else if (e.code == 'email-already-in-use') {
        throw 'An account already exists for this email.';
      } else {
        throw e.message;
      }
    }
    return userCredential;
  }
}
