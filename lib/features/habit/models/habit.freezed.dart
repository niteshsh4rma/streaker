// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Habit _$HabitFromJson(Map<String, dynamic> json) {
  return _Habit.fromJson(json);
}

/// @nodoc
mixin _$Habit {
  HabitType get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: emojiFromJson, toJson: emojiToJson)
  AnimatedEmojiData? get emoji => throw _privateConstructorUsedError;
  @JsonKey(fromJson: colorFromJson, toJson: colorToJson)
  Color get color => throw _privateConstructorUsedError;
  DateTime get when => throw _privateConstructorUsedError;
  Frequency get frequency => throw _privateConstructorUsedError;
  Time get time => throw _privateConstructorUsedError;
  Set<Day> get dailyFrequency => throw _privateConstructorUsedError;
  int get weeklyFrequency => throw _privateConstructorUsedError;
  Set<int> get monthlyFrequency => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timeOfDayfromJsonNullable, toJson: timeOfDaytoJsonNullable)
  TimeOfDay? get reminderTime => throw _privateConstructorUsedError;
  DateTime? get endsOn => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeIfNull: false, includeToJson: false)
  bool get isLoading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HabitCopyWith<Habit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitCopyWith<$Res> {
  factory $HabitCopyWith(Habit value, $Res Function(Habit) then) =
      _$HabitCopyWithImpl<$Res, Habit>;
  @useResult
  $Res call(
      {HabitType type,
      String name,
      @JsonKey(fromJson: emojiFromJson, toJson: emojiToJson)
      AnimatedEmojiData? emoji,
      @JsonKey(fromJson: colorFromJson, toJson: colorToJson) Color color,
      DateTime when,
      Frequency frequency,
      Time time,
      Set<Day> dailyFrequency,
      int weeklyFrequency,
      Set<int> monthlyFrequency,
      @JsonKey(
          fromJson: timeOfDayfromJsonNullable, toJson: timeOfDaytoJsonNullable)
      TimeOfDay? reminderTime,
      DateTime? endsOn,
      @JsonKey(
          includeFromJson: false, includeIfNull: false, includeToJson: false)
      bool isLoading});
}

/// @nodoc
class _$HabitCopyWithImpl<$Res, $Val extends Habit>
    implements $HabitCopyWith<$Res> {
  _$HabitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = null,
    Object? emoji = freezed,
    Object? color = null,
    Object? when = null,
    Object? frequency = null,
    Object? time = null,
    Object? dailyFrequency = null,
    Object? weeklyFrequency = null,
    Object? monthlyFrequency = null,
    Object? reminderTime = freezed,
    Object? endsOn = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HabitType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      emoji: freezed == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as AnimatedEmojiData?,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      when: null == when
          ? _value.when
          : when // ignore: cast_nullable_to_non_nullable
              as DateTime,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as Frequency,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Time,
      dailyFrequency: null == dailyFrequency
          ? _value.dailyFrequency
          : dailyFrequency // ignore: cast_nullable_to_non_nullable
              as Set<Day>,
      weeklyFrequency: null == weeklyFrequency
          ? _value.weeklyFrequency
          : weeklyFrequency // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyFrequency: null == monthlyFrequency
          ? _value.monthlyFrequency
          : monthlyFrequency // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      reminderTime: freezed == reminderTime
          ? _value.reminderTime
          : reminderTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      endsOn: freezed == endsOn
          ? _value.endsOn
          : endsOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HabitImplCopyWith<$Res> implements $HabitCopyWith<$Res> {
  factory _$$HabitImplCopyWith(
          _$HabitImpl value, $Res Function(_$HabitImpl) then) =
      __$$HabitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HabitType type,
      String name,
      @JsonKey(fromJson: emojiFromJson, toJson: emojiToJson)
      AnimatedEmojiData? emoji,
      @JsonKey(fromJson: colorFromJson, toJson: colorToJson) Color color,
      DateTime when,
      Frequency frequency,
      Time time,
      Set<Day> dailyFrequency,
      int weeklyFrequency,
      Set<int> monthlyFrequency,
      @JsonKey(
          fromJson: timeOfDayfromJsonNullable, toJson: timeOfDaytoJsonNullable)
      TimeOfDay? reminderTime,
      DateTime? endsOn,
      @JsonKey(
          includeFromJson: false, includeIfNull: false, includeToJson: false)
      bool isLoading});
}

/// @nodoc
class __$$HabitImplCopyWithImpl<$Res>
    extends _$HabitCopyWithImpl<$Res, _$HabitImpl>
    implements _$$HabitImplCopyWith<$Res> {
  __$$HabitImplCopyWithImpl(
      _$HabitImpl _value, $Res Function(_$HabitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = null,
    Object? emoji = freezed,
    Object? color = null,
    Object? when = null,
    Object? frequency = null,
    Object? time = null,
    Object? dailyFrequency = null,
    Object? weeklyFrequency = null,
    Object? monthlyFrequency = null,
    Object? reminderTime = freezed,
    Object? endsOn = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$HabitImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HabitType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      emoji: freezed == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as AnimatedEmojiData?,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      when: null == when
          ? _value.when
          : when // ignore: cast_nullable_to_non_nullable
              as DateTime,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as Frequency,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Time,
      dailyFrequency: null == dailyFrequency
          ? _value._dailyFrequency
          : dailyFrequency // ignore: cast_nullable_to_non_nullable
              as Set<Day>,
      weeklyFrequency: null == weeklyFrequency
          ? _value.weeklyFrequency
          : weeklyFrequency // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyFrequency: null == monthlyFrequency
          ? _value._monthlyFrequency
          : monthlyFrequency // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      reminderTime: freezed == reminderTime
          ? _value.reminderTime
          : reminderTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      endsOn: freezed == endsOn
          ? _value.endsOn
          : endsOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HabitImpl implements _Habit {
  const _$HabitImpl(
      {required this.type,
      required this.name,
      @JsonKey(fromJson: emojiFromJson, toJson: emojiToJson)
      required this.emoji,
      @JsonKey(fromJson: colorFromJson, toJson: colorToJson)
      this.color = Colors.blue,
      required this.when,
      this.frequency = Frequency.daily,
      this.time = Time.morning,
      final Set<Day> dailyFrequency = const {},
      this.weeklyFrequency = 1,
      final Set<int> monthlyFrequency = const {},
      @JsonKey(
          fromJson: timeOfDayfromJsonNullable, toJson: timeOfDaytoJsonNullable)
      this.reminderTime,
      this.endsOn,
      @JsonKey(
          includeFromJson: false, includeIfNull: false, includeToJson: false)
      this.isLoading = false})
      : _dailyFrequency = dailyFrequency,
        _monthlyFrequency = monthlyFrequency;

  factory _$HabitImpl.fromJson(Map<String, dynamic> json) =>
      _$$HabitImplFromJson(json);

  @override
  final HabitType type;
  @override
  final String name;
  @override
  @JsonKey(fromJson: emojiFromJson, toJson: emojiToJson)
  final AnimatedEmojiData? emoji;
  @override
  @JsonKey(fromJson: colorFromJson, toJson: colorToJson)
  final Color color;
  @override
  final DateTime when;
  @override
  @JsonKey()
  final Frequency frequency;
  @override
  @JsonKey()
  final Time time;
  final Set<Day> _dailyFrequency;
  @override
  @JsonKey()
  Set<Day> get dailyFrequency {
    if (_dailyFrequency is EqualUnmodifiableSetView) return _dailyFrequency;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_dailyFrequency);
  }

  @override
  @JsonKey()
  final int weeklyFrequency;
  final Set<int> _monthlyFrequency;
  @override
  @JsonKey()
  Set<int> get monthlyFrequency {
    if (_monthlyFrequency is EqualUnmodifiableSetView) return _monthlyFrequency;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_monthlyFrequency);
  }

  @override
  @JsonKey(fromJson: timeOfDayfromJsonNullable, toJson: timeOfDaytoJsonNullable)
  final TimeOfDay? reminderTime;
  @override
  final DateTime? endsOn;
  @override
  @JsonKey(includeFromJson: false, includeIfNull: false, includeToJson: false)
  final bool isLoading;

  @override
  String toString() {
    return 'Habit(type: $type, name: $name, emoji: $emoji, color: $color, when: $when, frequency: $frequency, time: $time, dailyFrequency: $dailyFrequency, weeklyFrequency: $weeklyFrequency, monthlyFrequency: $monthlyFrequency, reminderTime: $reminderTime, endsOn: $endsOn, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.when, when) || other.when == when) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.time, time) || other.time == time) &&
            const DeepCollectionEquality()
                .equals(other._dailyFrequency, _dailyFrequency) &&
            (identical(other.weeklyFrequency, weeklyFrequency) ||
                other.weeklyFrequency == weeklyFrequency) &&
            const DeepCollectionEquality()
                .equals(other._monthlyFrequency, _monthlyFrequency) &&
            (identical(other.reminderTime, reminderTime) ||
                other.reminderTime == reminderTime) &&
            (identical(other.endsOn, endsOn) || other.endsOn == endsOn) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      name,
      emoji,
      color,
      when,
      frequency,
      time,
      const DeepCollectionEquality().hash(_dailyFrequency),
      weeklyFrequency,
      const DeepCollectionEquality().hash(_monthlyFrequency),
      reminderTime,
      endsOn,
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitImplCopyWith<_$HabitImpl> get copyWith =>
      __$$HabitImplCopyWithImpl<_$HabitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HabitImplToJson(
      this,
    );
  }
}

abstract class _Habit implements Habit {
  const factory _Habit(
      {required final HabitType type,
      required final String name,
      @JsonKey(fromJson: emojiFromJson, toJson: emojiToJson)
      required final AnimatedEmojiData? emoji,
      @JsonKey(fromJson: colorFromJson, toJson: colorToJson) final Color color,
      required final DateTime when,
      final Frequency frequency,
      final Time time,
      final Set<Day> dailyFrequency,
      final int weeklyFrequency,
      final Set<int> monthlyFrequency,
      @JsonKey(
          fromJson: timeOfDayfromJsonNullable, toJson: timeOfDaytoJsonNullable)
      final TimeOfDay? reminderTime,
      final DateTime? endsOn,
      @JsonKey(
          includeFromJson: false, includeIfNull: false, includeToJson: false)
      final bool isLoading}) = _$HabitImpl;

  factory _Habit.fromJson(Map<String, dynamic> json) = _$HabitImpl.fromJson;

  @override
  HabitType get type;
  @override
  String get name;
  @override
  @JsonKey(fromJson: emojiFromJson, toJson: emojiToJson)
  AnimatedEmojiData? get emoji;
  @override
  @JsonKey(fromJson: colorFromJson, toJson: colorToJson)
  Color get color;
  @override
  DateTime get when;
  @override
  Frequency get frequency;
  @override
  Time get time;
  @override
  Set<Day> get dailyFrequency;
  @override
  int get weeklyFrequency;
  @override
  Set<int> get monthlyFrequency;
  @override
  @JsonKey(fromJson: timeOfDayfromJsonNullable, toJson: timeOfDaytoJsonNullable)
  TimeOfDay? get reminderTime;
  @override
  DateTime? get endsOn;
  @override
  @JsonKey(includeFromJson: false, includeIfNull: false, includeToJson: false)
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$HabitImplCopyWith<_$HabitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
