// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CallLogModel _$CallLogModelFromJson(Map<String, dynamic> json) {
  return _CallLogModel.fromJson(json);
}

/// @nodoc
mixin _$CallLogModel {
  String get name => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  CallType get callType => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CallLogModelCopyWith<CallLogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallLogModelCopyWith<$Res> {
  factory $CallLogModelCopyWith(
          CallLogModel value, $Res Function(CallLogModel) then) =
      _$CallLogModelCopyWithImpl<$Res, CallLogModel>;
  @useResult
  $Res call(
      {String name,
      String number,
      CallType callType,
      DateTime dateTime,
      Duration duration});
}

/// @nodoc
class _$CallLogModelCopyWithImpl<$Res, $Val extends CallLogModel>
    implements $CallLogModelCopyWith<$Res> {
  _$CallLogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? number = null,
    Object? callType = null,
    Object? dateTime = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      callType: null == callType
          ? _value.callType
          : callType // ignore: cast_nullable_to_non_nullable
              as CallType,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CallLogModelImplCopyWith<$Res>
    implements $CallLogModelCopyWith<$Res> {
  factory _$$CallLogModelImplCopyWith(
          _$CallLogModelImpl value, $Res Function(_$CallLogModelImpl) then) =
      __$$CallLogModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String number,
      CallType callType,
      DateTime dateTime,
      Duration duration});
}

/// @nodoc
class __$$CallLogModelImplCopyWithImpl<$Res>
    extends _$CallLogModelCopyWithImpl<$Res, _$CallLogModelImpl>
    implements _$$CallLogModelImplCopyWith<$Res> {
  __$$CallLogModelImplCopyWithImpl(
      _$CallLogModelImpl _value, $Res Function(_$CallLogModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? number = null,
    Object? callType = null,
    Object? dateTime = null,
    Object? duration = null,
  }) {
    return _then(_$CallLogModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      callType: null == callType
          ? _value.callType
          : callType // ignore: cast_nullable_to_non_nullable
              as CallType,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CallLogModelImpl implements _CallLogModel {
  const _$CallLogModelImpl(
      {required this.name,
      required this.number,
      required this.callType,
      required this.dateTime,
      required this.duration});

  factory _$CallLogModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallLogModelImplFromJson(json);

  @override
  final String name;
  @override
  final String number;
  @override
  final CallType callType;
  @override
  final DateTime dateTime;
  @override
  final Duration duration;

  @override
  String toString() {
    return 'CallLogModel(name: $name, number: $number, callType: $callType, dateTime: $dateTime, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallLogModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.callType, callType) ||
                other.callType == callType) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, number, callType, dateTime, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CallLogModelImplCopyWith<_$CallLogModelImpl> get copyWith =>
      __$$CallLogModelImplCopyWithImpl<_$CallLogModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallLogModelImplToJson(
      this,
    );
  }
}

abstract class _CallLogModel implements CallLogModel {
  const factory _CallLogModel(
      {required final String name,
      required final String number,
      required final CallType callType,
      required final DateTime dateTime,
      required final Duration duration}) = _$CallLogModelImpl;

  factory _CallLogModel.fromJson(Map<String, dynamic> json) =
      _$CallLogModelImpl.fromJson;

  @override
  String get name;
  @override
  String get number;
  @override
  CallType get callType;
  @override
  DateTime get dateTime;
  @override
  Duration get duration;
  @override
  @JsonKey(ignore: true)
  _$$CallLogModelImplCopyWith<_$CallLogModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
