import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:streaker/core/services/auth_service.dart';

class DbService {
  static final _db = FirebaseFirestore.instance.collection(kDebugMode ? 'development' : 'production');

  static Future<bool> isUserAlreadyExists() {
    // Check if user already exists
    return _db.doc(AuthService.user!.uid).get().then((doc) => doc.exists);
  }

  static Future<User?> createUser() {
    // Create user
    return _db.doc(AuthService.user!.uid).set({
      'isOnboarded': false,
    }).then((_) => AuthService.user);
  }

  static Future<bool> isOnboarded() {
    // Is User Onboarded
    return _db.doc(AuthService.user!.uid).get().then((doc) => doc.get('isOnboarded'));
  }
}