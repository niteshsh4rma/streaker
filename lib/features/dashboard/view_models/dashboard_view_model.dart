import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardViewModelProvider = ChangeNotifierProvider((ref) => DashboardViewModel());

class DashboardViewModel extends ChangeNotifier {
  // Add your properties and methods here

  // Example property
  int _counter = 0;
  int get counter => _counter;

  // Example method
  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}