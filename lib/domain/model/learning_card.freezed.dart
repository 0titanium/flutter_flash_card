// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LearningCard _$LearningCardFromJson(Map<String, dynamic> json) {
  return _LearningCard.fromJson(json);
}

/// @nodoc
mixin _$LearningCard {
  String get id => throw _privateConstructorUsedError;
  String get frontText => throw _privateConstructorUsedError;
  String get backText => throw _privateConstructorUsedError;
  bool get know => throw _privateConstructorUsedError;

  /// Serializes this LearningCard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LearningCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LearningCardCopyWith<LearningCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningCardCopyWith<$Res> {
  factory $LearningCardCopyWith(
          LearningCard value, $Res Function(LearningCard) then) =
      _$LearningCardCopyWithImpl<$Res, LearningCard>;
  @useResult
  $Res call({String id, String frontText, String backText, bool know});
}

/// @nodoc
class _$LearningCardCopyWithImpl<$Res, $Val extends LearningCard>
    implements $LearningCardCopyWith<$Res> {
  _$LearningCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LearningCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? frontText = null,
    Object? backText = null,
    Object? know = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      frontText: null == frontText
          ? _value.frontText
          : frontText // ignore: cast_nullable_to_non_nullable
              as String,
      backText: null == backText
          ? _value.backText
          : backText // ignore: cast_nullable_to_non_nullable
              as String,
      know: null == know
          ? _value.know
          : know // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LearningCardImplCopyWith<$Res>
    implements $LearningCardCopyWith<$Res> {
  factory _$$LearningCardImplCopyWith(
          _$LearningCardImpl value, $Res Function(_$LearningCardImpl) then) =
      __$$LearningCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String frontText, String backText, bool know});
}

/// @nodoc
class __$$LearningCardImplCopyWithImpl<$Res>
    extends _$LearningCardCopyWithImpl<$Res, _$LearningCardImpl>
    implements _$$LearningCardImplCopyWith<$Res> {
  __$$LearningCardImplCopyWithImpl(
      _$LearningCardImpl _value, $Res Function(_$LearningCardImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearningCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? frontText = null,
    Object? backText = null,
    Object? know = null,
  }) {
    return _then(_$LearningCardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      frontText: null == frontText
          ? _value.frontText
          : frontText // ignore: cast_nullable_to_non_nullable
              as String,
      backText: null == backText
          ? _value.backText
          : backText // ignore: cast_nullable_to_non_nullable
              as String,
      know: null == know
          ? _value.know
          : know // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LearningCardImpl implements _LearningCard {
  const _$LearningCardImpl(
      {required this.id,
      required this.frontText,
      required this.backText,
      this.know = false});

  factory _$LearningCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$LearningCardImplFromJson(json);

  @override
  final String id;
  @override
  final String frontText;
  @override
  final String backText;
  @override
  @JsonKey()
  final bool know;

  @override
  String toString() {
    return 'LearningCard(id: $id, frontText: $frontText, backText: $backText, know: $know)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearningCardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.frontText, frontText) ||
                other.frontText == frontText) &&
            (identical(other.backText, backText) ||
                other.backText == backText) &&
            (identical(other.know, know) || other.know == know));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, frontText, backText, know);

  /// Create a copy of LearningCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LearningCardImplCopyWith<_$LearningCardImpl> get copyWith =>
      __$$LearningCardImplCopyWithImpl<_$LearningCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LearningCardImplToJson(
      this,
    );
  }
}

abstract class _LearningCard implements LearningCard {
  const factory _LearningCard(
      {required final String id,
      required final String frontText,
      required final String backText,
      final bool know}) = _$LearningCardImpl;

  factory _LearningCard.fromJson(Map<String, dynamic> json) =
      _$LearningCardImpl.fromJson;

  @override
  String get id;
  @override
  String get frontText;
  @override
  String get backText;
  @override
  bool get know;

  /// Create a copy of LearningCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LearningCardImplCopyWith<_$LearningCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
