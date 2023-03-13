import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_cv/models/user.dart';
import 'package:my_cv/services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user object based on FirebaseUser
  newUser _userFromFirebaseUser(User user) {
    return user != null ? newUser(uid: user.uid) : null;
  }

  //Auth change user stream
  Stream<newUser> get user {
    return _auth.authStateChanges()
        .map(_userFromFirebaseUser);
  }

  // Sign in anonymously
  Future signInAnon() async {
    try  {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign up with email and password
  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      User user = result.user;

      // Create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData(
          'firstName',
          'lastName',
          'gender',
          'occupation',
      );
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}