// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Card _$CardFromJson(Map<String, dynamic> json) {
  return _Card.fromJson(json);
}

/// @nodoc
mixin _$Card {
  String get id => throw _privateConstructorUsedError;
  String get frontText => throw _privateConstructorUsedError;
  String get backText => throw _privateConstructorUsedError;
  bool get know => throw _privateConstructorUsedError;

  /// Serializes this Card to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Card
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CardCopyWith<Card> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardCopyWith<$Res> {
  factory $CardCopyWith(Card value, $Res Function(Card) then) =
      _$CardCopyWithImpl<$Res, Card>;
  @useResult
  $Res call({String id, String frontText, String backText, bool know});
}

/// @nodoc
class _$CardCopyWithImpl<$Res, $Val extends Card>
    implements $CardCopyWith<$Res> {
  _$CardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Card
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
abstract class _$$CardImplCopyWith<$Res> implements $CardCopyWith<$Res> {
  factory _$$CardImplCopyWith(
          _$CardImpl value, $Res Function(_$CardImpl) then) =
      __$$CardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String frontText, String backText, bool know});
}

/// @nodoc
class __$$CardImplCopyWithImpl<$Res>
    extends _$CardCopyWithImpl<$Res, _$CardImpl>
    implements _$$CardImplCopyWith<$Res> {
  __$$CardImplCopyWithImpl(_$CardImpl _value, $Res Function(_$CardImpl) _then)
      : super(_value, _then);

  /// Create a copy of Card
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? frontText = null,
    Object? backText = null,
    Object? know = null,
  }) {
    return _then(_$CardImpl(
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
class _$CardImpl implements _Card {
  const _$CardImpl(
      {required this.id,
      required this.frontText,
      required this.backText,
      this.know = false});

  factory _$CardImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardImplFromJson(json);

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
    return 'Card(id: $id, frontText: $frontText, backText: $backText, know: $know)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardImpl &&
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

  /// Create a copy of Card
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardImplCopyWith<_$CardImpl> get copyWith =>
      __$$CardImplCopyWithImpl<_$CardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardImplToJson(
      this,
    );
  }
}

abstract class _Card implements Card {
  const factory _Card(
      {required final String id,
      required final String frontText,
      required final String backText,
      final bool know}) = _$CardImpl;

  factory _Card.fromJson(Map<String, dynamic> json) = _$CardImpl.fromJson;

  @override
  String get id;
  @override
  String get frontText;
  @override
  String get backText;
  @override
  bool get know;

  /// Create a copy of Card
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardImplCopyWith<_$CardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
