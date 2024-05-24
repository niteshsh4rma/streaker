// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OnboardingState _$OnboardingStateFromJson(Map<String, dynamic> json) {
  return _OnboardingState.fromJson(json);
}

/// @nodoc
mixin _$OnboardingState {
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get isLoading => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  int get currentPage => throw _privateConstructorUsedError;
  Sleep? get sleep => throw _privateConstructorUsedError;
  DateTime? get wakeUpTime => throw _privateConstructorUsedError;
  DateTime? get bedTime => throw _privateConstructorUsedError;
  Procrastinate? get procrastinate => throw _privateConstructorUsedError;
  FocusIssue? get focusIssue => throw _privateConstructorUsedError;
  List<Influence> get influences => throw _privateConstructorUsedError;
  List<Goal> get goals => throw _privateConstructorUsedError;
  bool get contractSigned => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OnboardingStateCopyWith<OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res, OnboardingState>;
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) bool isLoading,
      @JsonKey(includeFromJson: false, includeToJson: false) int currentPage,
      Sleep? sleep,
      DateTime? wakeUpTime,
      DateTime? bedTime,
      Procrastinate? procrastinate,
      FocusIssue? focusIssue,
      List<Influence> influences,
      List<Goal> goals,
      bool contractSigned});
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res, $Val extends OnboardingState>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? currentPage = null,
    Object? sleep = freezed,
    Object? wakeUpTime = freezed,
    Object? bedTime = freezed,
    Object? procrastinate = freezed,
    Object? focusIssue = freezed,
    Object? influences = null,
    Object? goals = null,
    Object? contractSigned = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      sleep: freezed == sleep
          ? _value.sleep
          : sleep // ignore: cast_nullable_to_non_nullable
              as Sleep?,
      wakeUpTime: freezed == wakeUpTime
          ? _value.wakeUpTime
          : wakeUpTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bedTime: freezed == bedTime
          ? _value.bedTime
          : bedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      procrastinate: freezed == procrastinate
          ? _value.procrastinate
          : procrastinate // ignore: cast_nullable_to_non_nullable
              as Procrastinate?,
      focusIssue: freezed == focusIssue
          ? _value.focusIssue
          : focusIssue // ignore: cast_nullable_to_non_nullable
              as FocusIssue?,
      influences: null == influences
          ? _value.influences
          : influences // ignore: cast_nullable_to_non_nullable
              as List<Influence>,
      goals: null == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<Goal>,
      contractSigned: null == contractSigned
          ? _value.contractSigned
          : contractSigned // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnboardingStateImplCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$$OnboardingStateImplCopyWith(_$OnboardingStateImpl value,
          $Res Function(_$OnboardingStateImpl) then) =
      __$$OnboardingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) bool isLoading,
      @JsonKey(includeFromJson: false, includeToJson: false) int currentPage,
      Sleep? sleep,
      DateTime? wakeUpTime,
      DateTime? bedTime,
      Procrastinate? procrastinate,
      FocusIssue? focusIssue,
      List<Influence> influences,
      List<Goal> goals,
      bool contractSigned});
}

/// @nodoc
class __$$OnboardingStateImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingStateImpl>
    implements _$$OnboardingStateImplCopyWith<$Res> {
  __$$OnboardingStateImplCopyWithImpl(
      _$OnboardingStateImpl _value, $Res Function(_$OnboardingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? currentPage = null,
    Object? sleep = freezed,
    Object? wakeUpTime = freezed,
    Object? bedTime = freezed,
    Object? procrastinate = freezed,
    Object? focusIssue = freezed,
    Object? influences = null,
    Object? goals = null,
    Object? contractSigned = null,
  }) {
    return _then(_$OnboardingStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      sleep: freezed == sleep
          ? _value.sleep
          : sleep // ignore: cast_nullable_to_non_nullable
              as Sleep?,
      wakeUpTime: freezed == wakeUpTime
          ? _value.wakeUpTime
          : wakeUpTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bedTime: freezed == bedTime
          ? _value.bedTime
          : bedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      procrastinate: freezed == procrastinate
          ? _value.procrastinate
          : procrastinate // ignore: cast_nullable_to_non_nullable
              as Procrastinate?,
      focusIssue: freezed == focusIssue
          ? _value.focusIssue
          : focusIssue // ignore: cast_nullable_to_non_nullable
              as FocusIssue?,
      influences: null == influences
          ? _value._influences
          : influences // ignore: cast_nullable_to_non_nullable
              as List<Influence>,
      goals: null == goals
          ? _value._goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<Goal>,
      contractSigned: null == contractSigned
          ? _value.contractSigned
          : contractSigned // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OnboardingStateImpl implements _OnboardingState {
  _$OnboardingStateImpl(
      {@JsonKey(includeFromJson: false, includeToJson: false)
      this.isLoading = false,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.currentPage = 0,
      this.sleep,
      this.wakeUpTime,
      this.bedTime,
      this.procrastinate,
      this.focusIssue,
      final List<Influence> influences = const [],
      final List<Goal> goals = const [],
      this.contractSigned = false})
      : _influences = influences,
        _goals = goals;

  factory _$OnboardingStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$OnboardingStateImplFromJson(json);

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool isLoading;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final int currentPage;
  @override
  final Sleep? sleep;
  @override
  final DateTime? wakeUpTime;
  @override
  final DateTime? bedTime;
  @override
  final Procrastinate? procrastinate;
  @override
  final FocusIssue? focusIssue;
  final List<Influence> _influences;
  @override
  @JsonKey()
  List<Influence> get influences {
    if (_influences is EqualUnmodifiableListView) return _influences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_influences);
  }

  final List<Goal> _goals;
  @override
  @JsonKey()
  List<Goal> get goals {
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goals);
  }

  @override
  @JsonKey()
  final bool contractSigned;

  @override
  String toString() {
    return 'OnboardingState(isLoading: $isLoading, currentPage: $currentPage, sleep: $sleep, wakeUpTime: $wakeUpTime, bedTime: $bedTime, procrastinate: $procrastinate, focusIssue: $focusIssue, influences: $influences, goals: $goals, contractSigned: $contractSigned)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.sleep, sleep) || other.sleep == sleep) &&
            (identical(other.wakeUpTime, wakeUpTime) ||
                other.wakeUpTime == wakeUpTime) &&
            (identical(other.bedTime, bedTime) || other.bedTime == bedTime) &&
            (identical(other.procrastinate, procrastinate) ||
                other.procrastinate == procrastinate) &&
            (identical(other.focusIssue, focusIssue) ||
                other.focusIssue == focusIssue) &&
            const DeepCollectionEquality()
                .equals(other._influences, _influences) &&
            const DeepCollectionEquality().equals(other._goals, _goals) &&
            (identical(other.contractSigned, contractSigned) ||
                other.contractSigned == contractSigned));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      currentPage,
      sleep,
      wakeUpTime,
      bedTime,
      procrastinate,
      focusIssue,
      const DeepCollectionEquality().hash(_influences),
      const DeepCollectionEquality().hash(_goals),
      contractSigned);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      __$$OnboardingStateImplCopyWithImpl<_$OnboardingStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OnboardingStateImplToJson(
      this,
    );
  }
}

abstract class _OnboardingState implements OnboardingState {
  factory _OnboardingState(
      {@JsonKey(includeFromJson: false, includeToJson: false)
      final bool isLoading,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final int currentPage,
      final Sleep? sleep,
      final DateTime? wakeUpTime,
      final DateTime? bedTime,
      final Procrastinate? procrastinate,
      final FocusIssue? focusIssue,
      final List<Influence> influences,
      final List<Goal> goals,
      final bool contractSigned}) = _$OnboardingStateImpl;

  factory _OnboardingState.fromJson(Map<String, dynamic> json) =
      _$OnboardingStateImpl.fromJson;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get isLoading;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  int get currentPage;
  @override
  Sleep? get sleep;
  @override
  DateTime? get wakeUpTime;
  @override
  DateTime? get bedTime;
  @override
  Procrastinate? get procrastinate;
  @override
  FocusIssue? get focusIssue;
  @override
  List<Influence> get influences;
  @override
  List<Goal> get goals;
  @override
  bool get contractSigned;
  @override
  @JsonKey(ignore: true)
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
