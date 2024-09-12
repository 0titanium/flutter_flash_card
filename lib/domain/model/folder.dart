import 'package:flutter_flash_card/domain/model/deck.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'folder.freezed.dart';

part 'folder.g.dart';

@freezed
class Folder with _$Folder {
  const factory Folder({
    required String id,
    required String name,
    required List<Folder>? subFolders,
    required List<Deck>? decks,
  }) = _Folder;

  factory Folder.fromJson(Map<String, Object?> json) => _$FolderFromJson(json);
}