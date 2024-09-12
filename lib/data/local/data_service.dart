import 'dart:convert';

import 'package:flutter_flash_card/domain/model/deck.dart';
import 'package:flutter_flash_card/domain/model/folder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataService {
  Future<void> saveRootFolder(Folder rootFolder) async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

    final String folderJson = jsonEncode(rootFolder.toJson());

    await asyncPrefs.setString('root_folder', folderJson);
  }

  Future<Folder> loadRootFolder() async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

    final String? folderJson = await asyncPrefs.getString('root_folder');

    if (folderJson == null) {
      return const Folder(id: 'root', name: 'Root', subFolders: [], decks: []);
    }

    return Folder.fromJson(jsonDecode(folderJson));
  }

  Folder addFolder(Folder parentFolder, String folderName) {
    final newFolder = Folder(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: folderName,
      subFolders: [],
      decks: [],
    );

    parentFolder.subFolders.add(newFolder);

    return newFolder;
  }

  void addDeck(Folder folder, Deck deck) {
    folder.decks.add(deck);
  }

  Folder? findFolder(Folder rootFolder, String folderId) {
    if (rootFolder.id == folderId) return rootFolder;

    for (var subfolder in rootFolder.subFolders) {
      final found = findFolder(subfolder, folderId);
      if (found != null) return found;
    }

    return null;
  }

  void moveDeck(
    Folder rootFolder,
    String sourceFolderId,
    String targetFolderId,
    String deckId,
  ) {
    final sourceFolder = findFolder(rootFolder, sourceFolderId);
    final targetFolder = findFolder(rootFolder, targetFolderId);

    if (sourceFolder != null && targetFolder != null) {
      final deckIndex =
          sourceFolder.decks.indexWhere((deck) => deck.id == deckId);

      if (deckIndex != -1) {
        final deck = sourceFolder.decks.removeAt(deckIndex);

        targetFolder.decks.add(deck);
      }
    }
  }
}
