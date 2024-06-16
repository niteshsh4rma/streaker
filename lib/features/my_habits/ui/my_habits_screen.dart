import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHabitsScreen extends ConsumerWidget {
  const MyHabitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Text('my habits screen'),
    );
  }
}
