// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FolderImpl _$$FolderImplFromJson(Map<String, dynamic> json) => _$FolderImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      subFolders: (json['subFolders'] as List<dynamic>)
          .map((e) => Folder.fromJson(e as Map<String, dynamic>))
          .toList(),
      decks: (json['decks'] as List<dynamic>)
          .map((e) => Deck.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FolderImplToJson(_$FolderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subFolders': instance.subFolders,
      'decks': instance.decks,
    };
