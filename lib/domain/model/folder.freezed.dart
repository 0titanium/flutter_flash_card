// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Folder _$FolderFromJson(Map<String, dynamic> json) {
  return _Folder.fromJson(json);
}

/// @nodoc
mixin _$Folder {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<Folder> get subFolders => throw _privateConstructorUsedError;
  List<Deck> get decks => throw _privateConstructorUsedError;

  /// Serializes this Folder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Folder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FolderCopyWith<Folder> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FolderCopyWith<$Res> {
  factory $FolderCopyWith(Folder value, $Res Function(Folder) then) =
      _$FolderCopyWithImpl<$Res, Folder>;
  @useResult
  $Res call(
      {String id, String name, List<Folder> subFolders, List<Deck> decks});
}

/// @nodoc
class _$FolderCopyWithImpl<$Res, $Val extends Folder>
    implements $FolderCopyWith<$Res> {
  _$FolderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Folder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? subFolders = null,
    Object? decks = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      subFolders: null == subFolders
          ? _value.subFolders
          : subFolders // ignore: cast_nullable_to_non_nullable
              as List<Folder>,
      decks: null == decks
          ? _value.decks
          : decks // ignore: cast_nullable_to_non_nullable
              as List<Deck>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FolderImplCopyWith<$Res> implements $FolderCopyWith<$Res> {
  factory _$$FolderImplCopyWith(
          _$FolderImpl value, $Res Function(_$FolderImpl) then) =
      __$$FolderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, List<Folder> subFolders, List<Deck> decks});
}

/// @nodoc
class __$$FolderImplCopyWithImpl<$Res>
    extends _$FolderCopyWithImpl<$Res, _$FolderImpl>
    implements _$$FolderImplCopyWith<$Res> {
  __$$FolderImplCopyWithImpl(
      _$FolderImpl _value, $Res Function(_$FolderImpl) _then)
      : super(_value, _then);

  /// Create a copy of Folder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? subFolders = null,
    Object? decks = null,
  }) {
    return _then(_$FolderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      subFolders: null == subFolders
          ? _value._subFolders
          : subFolders // ignore: cast_nullable_to_non_nullable
              as List<Folder>,
      decks: null == decks
          ? _value._decks
          : decks // ignore: cast_nullable_to_non_nullable
              as List<Deck>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FolderImpl implements _Folder {
  const _$FolderImpl(
      {required this.id,
      required this.name,
      required final List<Folder> subFolders,
      required final List<Deck> decks})
      : _subFolders = subFolders,
        _decks = decks;

  factory _$FolderImpl.fromJson(Map<String, dynamic> json) =>
      _$$FolderImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<Folder> _subFolders;
  @override
  List<Folder> get subFolders {
    if (_subFolders is EqualUnmodifiableListView) return _subFolders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subFolders);
  }

  final List<Deck> _decks;
  @override
  List<Deck> get decks {
    if (_decks is EqualUnmodifiableListView) return _decks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_decks);
  }

  @override
  String toString() {
    return 'Folder(id: $id, name: $name, subFolders: $subFolders, decks: $decks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FolderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._subFolders, _subFolders) &&
            const DeepCollectionEquality().equals(other._decks, _decks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_subFolders),
      const DeepCollectionEquality().hash(_decks));

  /// Create a copy of Folder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FolderImplCopyWith<_$FolderImpl> get copyWith =>
      __$$FolderImplCopyWithImpl<_$FolderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FolderImplToJson(
      this,
    );
  }
}

abstract class _Folder implements Folder {
  const factory _Folder(
      {required final String id,
      required final String name,
      required final List<Folder> subFolders,
      required final List<Deck> decks}) = _$FolderImpl;

  factory _Folder.fromJson(Map<String, dynamic> json) = _$FolderImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<Folder> get subFolders;
  @override
  List<Deck> get decks;

  /// Create a copy of Folder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FolderImplCopyWith<_$FolderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
