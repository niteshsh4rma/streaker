// ignore_for_file: use_build_context_synchronously

import 'package:animated_emoji/animated_emoji.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:streaker/features/habit/models/day.dart';
import 'package:streaker/features/habit/models/habit.dart';
import 'package:streaker/features/habit/view_models/add_habit_view_model.dart';
import 'package:table_calendar/table_calendar.dart';

class AddHabitScreen extends ConsumerWidget {
  const AddHabitScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habit = ref.watch(addHabitViewModelProvider);
    final vm = ref.read(addHabitViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: context.pop,
          icon: const Icon(Iconsax.close_square),
        ),
        title: const Text('Create New Habit'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _HabitTypeSlidingControl(
              type: habit.type,
              onValueChanged: (type) => vm.setHabit(type!),
            ),
            const Gap(24),
            TextField(
              controller: vm.nameController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Task Name',
                isDense: true,
              ),
              onChanged: (value) => vm.setName(value),
            ),
            const Gap(8),
            _IconSelection(),
            const Gap(8),
            Row(
              children: [
                Text(
                  'Color',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const Gap(8),
            ColorPicker(
              color: habit.color,
              padding: EdgeInsets.zero,
              onColorChanged: (Color color) => vm.setColor(color),
              enableShadesSelection: false,
              pickersEnabled: const {
                ColorPickerType.accent: false,
              },
            ),
            if (habit.type == HabitType.onetime) _When(),
            if (habit.type == HabitType.regular) ...[
              const Gap(8),
              _RepeatSelect(),
            ],
            const Gap(8),
            _DoItAtSelect(),
            if (habit.type == HabitType.regular) _EndsOn(),
            _Reminder(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border(
            top: BorderSide(
              color: Theme.of(context).dividerColor,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: FilledButton(
          onPressed: !habit.isLoading && vm.isValid()
              ? () async {
                  final isCreated = await vm.onSave();
                  if (isCreated) {
                    context.pop();
                  }
                }
              : null,
          child: habit.isLoading
              ? const SizedBox.square(
                  dimension: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : const Text('Save'),
        ),
      ),
    );
  }
}

class _Daily extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habit = ref.watch(addHabitViewModelProvider);
    final vm = ref.read(addHabitViewModelProvider.notifier);

    return Column(
      children: [
        const Row(
          children: [
            Text(
              'On these days:',
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: Day.values
                .map(
                  (e) => ChoiceChip(
                    onSelected: (day) => vm.toggleDailyFrequency(e),
                    label: Text(e.name[0].toUpperCase()),
                    selected: habit.dailyFrequency.contains(e),
                    showCheckmark: false,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _Weekly extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habit = ref.watch(addHabitViewModelProvider);
    final vm = ref.read(addHabitViewModelProvider.notifier);

    return Column(
      children: [
        const Row(
          children: [
            Text(
              'On these days',
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: List.generate(7, (index) => index + 1)
                .map(
                  (e) => ChoiceChip(
                    onSelected: (day) => vm.setWeeklyFrequency(e),
                    label: Text(e.toString()),
                    selected: habit.weeklyFrequency == e,
                    showCheckmark: false,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _Monthly extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = DateTime.now();
    final habit = ref.watch(addHabitViewModelProvider);
    final vm = ref.read(addHabitViewModelProvider.notifier);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: TableCalendar(
          firstDay: DateTime(today.year, today.month, 1),
          lastDay: DateTime(today.year, today.month + 1, 0),
          selectedDayPredicate: (day) => habit.monthlyFrequency.contains(
            day.day,
          ),
          onDaySelected: (day, _) => vm.toggleMonthlyFrequency(day.day),
          focusedDay: DateTime.now(),
          headerVisible: false,
        ),
      ),
    );
  }
}

class _Reminder extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habit = ref.watch(addHabitViewModelProvider);
    final vm = ref.read(addHabitViewModelProvider.notifier);

    return Column(
      children: [
        Row(
          children: [
            Text(
              'Reminder',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Spacer(),
            Switch(
              value: habit.reminderTime != null,
              onChanged: (value) =>
                  vm.setReminder(value ? TimeOfDay.now() : null),
            ),
          ],
        ),
        if (habit.reminderTime != null)
          TextField(
            readOnly: true,
            controller: TextEditingController(
              text: habit.reminderTime?.format(context),
            ),
            onTap: () async {
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              if (time != null) {
                vm.setReminder(time);
              }
            },
            decoration: const InputDecoration(
              filled: true,
              isDense: true,
              prefixIcon: Icon(Iconsax.clock),
              suffixIcon: Icon(Iconsax.pen_add),
            ),
          ),
      ],
    );
  }
}

class _DoItAtSelect extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habit = ref.watch(addHabitViewModelProvider);
    final vm = ref.read(addHabitViewModelProvider.notifier);

    return Column(
      children: [
        Row(
          children: [
            Text(
              'Do it at',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: Time.values
                .map(
                  (e) => ChoiceChip(
                    onSelected: (_) => vm.setTime(e),
                    label: Text(e.name.capitalize),
                    selected: habit.time == e,
                    showCheckmark: false,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _RepeatSelect extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habit = ref.watch(addHabitViewModelProvider);
    final vm = ref.read(addHabitViewModelProvider.notifier);

    return Column(
      children: [
        Row(
          children: [
            Text(
              'Repeat',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: Frequency.values
                .map(
                  (e) => ChoiceChip(
                    label: Text(e.name.capitalize),
                    selected: habit.frequency == e,
                    showCheckmark: false,
                    onSelected: (value) => vm.setFrequency(e),
                  ),
                )
                .toList(),
          ),
        ),
        if (habit.frequency == Frequency.daily)
          _Daily()
        else if (habit.frequency == Frequency.weekly)
          _Weekly()
        else if (habit.frequency == Frequency.monthly)
          _Monthly(),
      ],
    );
  }
}

class _EndsOn extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habit = ref.watch(addHabitViewModelProvider);
    final vm = ref.read(addHabitViewModelProvider.notifier);

    return Column(
      children: [
        Row(
          children: [
            Text(
              'End Habit on',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Spacer(),
            Switch(
              value: habit.endsOn != null,
              onChanged: (value) => vm.setEndsOn(value ? DateTime.now() : null),
            ),
          ],
        ),
        if (habit.endsOn != null)
          TextField(
            readOnly: true,
            controller: TextEditingController(
              text: DateFormat('EEEE, MMMM dd, yyyy').format(habit.endsOn!),
            ),
            onTap: () async {
              final now = DateTime.now();
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(now.year + 1, now.month, now.day - 1),
              );

              if (date != null) {
                vm.setEndsOn(date);
              }
            },
            decoration: const InputDecoration(
              filled: true,
              isDense: true,
              prefixIcon: Icon(Iconsax.calendar),
              suffixIcon: Icon(Iconsax.pen_add),
            ),
          ),
      ],
    );
  }
}

class _When extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habit = ref.watch(addHabitViewModelProvider);
    final vm = ref.read(addHabitViewModelProvider.notifier);

    return Column(
      children: [
        Row(
          children: [
            Text(
              'When',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        const Gap(8),
        TextField(
          readOnly: true,
          controller: TextEditingController(
            text: DateFormat('EEEE, MMMM dd, yyyy').format(habit.when),
          ),
          onTap: () async {
            final now = DateTime.now();
            final date = await showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime(now.year + 1, now.month, now.day - 1),
            );

            if (date != null) {
              vm.setWhen(date);
            }
          },
          decoration: const InputDecoration(
            filled: true,
            isDense: true,
            prefixIcon: Icon(Iconsax.calendar),
            suffixIcon: Icon(Iconsax.pen_add),
          ),
        ),
      ],
    );
  }
}

class _IconSelection extends ConsumerStatefulWidget {
  @override
  ConsumerState<_IconSelection> createState() => _IconSelectionState();
}

class _IconSelectionState extends ConsumerState<_IconSelection> {
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final habit = ref.watch(addHabitViewModelProvider);
    final vm = ref.read(addHabitViewModelProvider.notifier);

    return Column(
      children: [
        Row(
          children: [
            Text(
              'Icon',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          height: 150,
          child: Scrollbar(
            controller: scrollController,
            thumbVisibility: true,
            child: GridView.builder(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
              itemBuilder: (context, index) {
                final emoji = AnimatedEmojis.values[index];

                return ChoiceChip(
                  label: AnimatedEmoji(
                    emoji,
                    size: 30,
                  ),
                  selected: habit.emoji == emoji,
                  onSelected: (_) => vm.setEmoji(emoji),
                  showCheckmark: false,
                );
              },
              itemCount: AnimatedEmojis.values.length,
            ),
          ),
        ),
      ],
    );
  }
}

class _HabitTypeSlidingControl extends StatelessWidget {
  final HabitType type;
  final void Function(HabitType? type) onValueChanged;

  const _HabitTypeSlidingControl({
    required this.type,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<HabitType>(
      groupValue: type,
      children: const {
        HabitType.regular: Text('Regular Habit'),
        HabitType.onetime: Text('One Time Task'),
      },
      onValueChanged: onValueChanged,
    );
  }
}
