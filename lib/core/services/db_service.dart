import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:streaker/core/services/auth_service.dart';
import 'package:streaker/features/account/preferences/view_models/preferences_view_model.dart';
import 'package:streaker/features/habit/models/habit.dart';
import 'package:streaker/features/onboarding/view_models/onboarding_view_model.dart';

class DbService {
  static final _db = FirebaseFirestore.instance
      .collection(kDebugMode ? 'development' : 'production');

  static DocumentReference<Map<String, dynamic>> get doc {
    return _db.doc(AuthService.user!.uid);
  }

  static Future<bool> isUserAlreadyExists() {
    // Check if user already exists
    return doc.get().then((doc) => doc.exists);
  }

  static Future<User?> createUser() {
    // Create user
    return doc.set({
      'isOnboarded': false,
    }).then((_) => AuthService.user);
  }

  static Future<void> completeOnboarding(OnboardingState state) async {
    await Future.delayed(const Duration(seconds: 1));
    return doc.update({
      'isOnboarded': true,
      'onboarding': state.toJson(),
      'habits': [],
      'preferences': PreferencesState(
        morning: TimeOfDay.fromDateTime(state.wakeUpTime!),
        evening: TimeOfDay.fromDateTime(state.bedTime!),
      ).toJson(),
    });
  }

  static Future<bool> isOnboarded() {
    // Is User Onboarded
    return doc.get().then((doc) => doc.get('isOnboarded'));
  }

  static Future<PreferencesState> getPreferences() async {
    final preferncesMap = await doc.get().then((doc) => doc.get('preferences'));

    return PreferencesState.fromJson(preferncesMap as Map<String, dynamic>);
  }

  static Future<String?> addHabit(Habit habit) async {
    try {
      final response = await doc.collection('habits').add(habit.toJson());
      return response.id;
    } catch (err) {
      log(err.toString());
      return null;
    }
  }

  static Future<Map<String, Habit>> getHabits() async {
    final Map<String, Habit> data = {};
    try {
      QuerySnapshot querySnapshot = await doc.collection('habits').get();
      for (final item in querySnapshot.docs) {
        final itemData = item.data() as Map<String, dynamic>;
        final habit = Habit.fromJson(Map.from(itemData));

        data.putIfAbsent(
          item.id,
          () => habit,
        );
      }

      return data;
    } catch (error) {
      log(error.toString());
      return data;
    }
  }
}
