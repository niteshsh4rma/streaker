import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:streaker/core/services/db_service.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static User? get user => _auth.currentUser;

  // sign in with google
  static Future<User?> signInWithGoogle() async {
    try {
      UserCredential result =
          await _auth.signInWithProvider(GoogleAuthProvider());
      User? user = result.user;
      bool isUserAlreadyExists = await DbService.isUserAlreadyExists();
      if (isUserAlreadyExists) {
        return user;
      } else {
        return DbService.createUser();
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  // sign out
  static Future<void> signOut() async {
    try {
      return _auth.signOut();
    } catch (e) {
      log(e.toString());
    }
  }
}
