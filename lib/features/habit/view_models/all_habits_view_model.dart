import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streaker/features/habit/models/habit.dart';

part 'all_habits_view_model.g.dart';

@Riverpod(
  keepAlive: true,
)
class AllHabitsViewModel extends _$AllHabitsViewModel {
  @override
  Map<String, Habit> build() {
    return {};
  }

  void add({
    required String id,
    required Habit habit,
  }) {
    state = {...state, id: habit};
  }

  void addAll(Map<String, Habit> entries) {
    state = {...state, ...entries};
  }
}
