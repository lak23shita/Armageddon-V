import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  FirebaseAuth _auth;
  FirebaseFirestore _firestore;
  AuthProvider() {
    _auth = FirebaseAuth.instance;
    _firestore = FirebaseFirestore.instance;
  }

  Stream<User> user() {
    return _auth.authStateChanges();
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user.uid;
    } catch (e) {
      print(e.toString());
      return e.code;
    }
  }

  Future registerWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = result.user;

      if (user != null) _saveToFirestore(user, name);
      return user.uid;
    } catch (e) {
      print(e.toString());
      return e.code;
    }
  }

  void _saveToFirestore(User user, String name) {
    _firestore.collection("users").doc(user.uid).set({
      "name": name,
      "email": user.email,
    });
  }

  void signOut() {
    _auth.signOut();
  }
}
