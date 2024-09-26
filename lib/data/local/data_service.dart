import 'dart:convert';

import 'package:flutter_flash_card/domain/model/card.dart';
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

    return parentFolder
        .copyWith(subFolders: [...parentFolder.subFolders, newFolder]);
  }

  Folder addDeck(Folder folder, String deckName) {
    final newDeck = Deck(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      deckName: deckName,
      cards: [],
    );

    return folder.copyWith(decks: [...folder.decks, newDeck]);
  }

  Folder? findFolder(Folder rootFolder, String folderId) {
    if (rootFolder.id == folderId) return rootFolder;

    for (var subfolder in rootFolder.subFolders) {
      final found = findFolder(subfolder, folderId);
      if (found != null) return found;
    }

    return null;
  }

  Folder replaceFolder(Folder rootFolder, Folder updatedFolder) {
    if (rootFolder.id == updatedFolder.id) {
      return updatedFolder;
    }
    return rootFolder.copyWith(
      subFolders: rootFolder.subFolders.map((subFolder) {
        if (subFolder.id == updatedFolder.id) {
          return updatedFolder;
        }
        return replaceFolder(subFolder, updatedFolder);
      }).toList(),
    );
  }

  Deck addCard(Deck deck, String frontText, String backText) {
    final newCard = Card(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      frontText: frontText,
      backText: backText,
    );

    return deck.copyWith(cards: [...deck.cards, newCard]);
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
