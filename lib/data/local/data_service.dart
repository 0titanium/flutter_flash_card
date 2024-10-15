import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_flash_card/domain/model/learning_card.dart';
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

  Future<bool> editFolderName(String folderId, String newFolderName) async {
    try {
      Folder rootFolder = await loadRootFolder();
      Folder updatedRootFolder =
          _updateFolderName(rootFolder, folderId, newFolderName);

      if (rootFolder == updatedRootFolder) {
        debugPrint('Error: Folder not found');
        return false;
      }

      await saveRootFolder(updatedRootFolder);
      return true;
    } catch (e) {
      debugPrint('Error updating folder name: $e');
      return false;
    }
  }

  Folder _updateFolderName(
      Folder folder, String folderId, String newFolderName) {
    if (folder.id == folderId) {
      return folder.copyWith(name: newFolderName);
    }

    List<Folder> updatedSubFolders = folder.subFolders
        .map((subFolder) =>
            _updateFolderName(subFolder, folderId, newFolderName))
        .toList();

    return folder.copyWith(subFolders: updatedSubFolders);
  }

  Future<bool> deleteFolder(String folderId) async {
    try {
      Folder rootFolder = await loadRootFolder();
      Folder updatedRootFolder = _removeFolder(rootFolder, folderId);

      if (rootFolder == updatedRootFolder) {
        debugPrint('Error: Folder not found');
        return false;
      }

      await saveRootFolder(updatedRootFolder);
      return true;
    } catch (e) {
      debugPrint('Error deleting folder: $e');
      return false;
    }
  }

  Folder _removeFolder(Folder folder, String folderId) {
    List<Folder> updatedSubFolders = folder.subFolders
        .where((subFolder) => subFolder.id != folderId)
        .toList();

    if (updatedSubFolders.length < folder.subFolders.length) {
      return folder.copyWith(subFolders: updatedSubFolders);
    }

    updatedSubFolders = updatedSubFolders
        .map((subFolder) => _removeFolder(subFolder, folderId))
        .toList();

    return folder.copyWith(subFolders: updatedSubFolders);
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

  Folder addDeck(Folder folder, String deckName) {
    final newDeck = Deck(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      deckName: deckName,
      cards: [],
    );

    return folder.copyWith(decks: [...folder.decks, newDeck]);
  }

  Future<bool> editDeckName(String deckId, String newDeckName) async {
    try {
      Folder rootFolder = await loadRootFolder();
      Deck? deck = findDeck(rootFolder, deckId);

      if (deck != null) {
        deck = deck.copyWith(deckName: newDeckName);
        rootFolder = replaceDeck(rootFolder, deck);

        await saveRootFolder(rootFolder);

        return true;
      } else {
        debugPrint('Error: Deck not found');
        return false;
      }
    } catch (e) {
      debugPrint('Error updating deck: $e');
      return false;
    }
  }

  Future<bool> deleteDeck(String deckId) async {
    try {
      Folder rootFolder = await loadRootFolder();
      Folder updatedRootFolder = _removeDeckFromFolder(rootFolder, deckId);

      if (rootFolder == updatedRootFolder) {
        debugPrint('Error: Deck not found');
        return false;
      }

      await saveRootFolder(updatedRootFolder);
      return true;
    } catch (e) {
      debugPrint('Error deleting deck: $e');
      return false;
    }
  }

  Folder _removeDeckFromFolder(Folder folder, String deckId) {
    List<Deck> updatedDecks =
        folder.decks.where((deck) => deck.id != deckId).toList();

    if (updatedDecks.length < folder.decks.length) {
      return folder.copyWith(decks: updatedDecks);
    }

    List<Folder> updatedSubFolders = folder.subFolders
        .map((subFolder) => _removeDeckFromFolder(subFolder, deckId))
        .toList();

    return folder.copyWith(subFolders: updatedSubFolders);
  }

  Future<Deck?> addCard(
      String deckId, String frontText, String backText) async {
    try {
      Folder rootFolder = await loadRootFolder();
      Deck? deck = findDeck(rootFolder, deckId);

      if (deck != null) {
        final newCard = LearningCard(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          frontText: frontText,
          backText: backText,
        );

        deck = deck.copyWith(cards: [...deck.cards, newCard]);
        rootFolder = replaceDeck(rootFolder, deck);

        await saveRootFolder(rootFolder);

        return deck;
      } else {
        debugPrint('Error: Deck not found');
        return null;
      }
    } catch (e) {
      debugPrint('Error adding card: $e');
      return null;
    }
  }

  Deck? findDeck(Folder rootFolder, String deckId) {
    for (var deck in rootFolder.decks) {
      if (deck.id == deckId) return deck;
    }
    for (var subfolder in rootFolder.subFolders) {
      final found = findDeck(subfolder, deckId);

      if (found != null) return found;
    }
    return null;
  }

  Folder replaceDeck(Folder rootFolder, Deck updatedDeck) {
    return rootFolder.copyWith(
      decks: rootFolder.decks
          .map((deck) => deck.id == updatedDeck.id ? updatedDeck : deck)
          .toList(),
      subFolders: rootFolder.subFolders
          .map((subFolder) => replaceDeck(subFolder, updatedDeck))
          .toList(),
    );
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

  Future<bool> editCard(String deckId, String cardId, String newFrontText,
      String newBackText) async {
    try {
      Folder rootFolder = await loadRootFolder();
      Deck? deck = findDeck(rootFolder, deckId);

      if (deck != null) {
        final updatedCards = deck.cards.map((card) {
          if (card.id == cardId) {
            return card.copyWith(
                frontText: newFrontText, backText: newBackText);
          }
          return card;
        }).toList();

        if (deck.cards.length != updatedCards.length) {
          debugPrint('Error: Card not found');
          return false;
        }

        deck = deck.copyWith(cards: updatedCards);
        rootFolder = replaceDeck(rootFolder, deck);

        await saveRootFolder(rootFolder);

        return true;
      } else {
        debugPrint('Error: Deck not found');
        return false;
      }
    } catch (e) {
      debugPrint('Error editing card: $e');
      return false;
    }
  }

  Future<bool> deleteCard(String deckId, String cardId) async {
    try {
      Folder rootFolder = await loadRootFolder();
      Deck? deck = findDeck(rootFolder, deckId);

      if (deck != null) {
        final updatedCards =
            deck.cards.where((card) => card.id != cardId).toList();

        if (updatedCards.length == deck.cards.length) {
          debugPrint('Error: Card not found');
          return false;
        }

        deck = deck.copyWith(cards: updatedCards);
        rootFolder = replaceDeck(rootFolder, deck);

        await saveRootFolder(rootFolder);

        return true;
      } else {
        debugPrint('Error: Deck not found');
        return false;
      }
    } catch (e) {
      debugPrint('Error deleting card: $e');
      return false;
    }
  }

  Future<bool> checkIsKnownCard(
      String deckId, String cardId, bool isKnown) async {
    try {
      Folder rootFolder = await loadRootFolder();
      Deck? deck = findDeck(rootFolder, deckId);

      if (deck != null) {
        final updatedCards = deck.cards.map((card) {
          if (card.id == cardId) {
            if (isKnown) {
              return card.copyWith(know: true);
            } else {
              return card.copyWith(know: false);
            }
          }
          return card;
        }).toList();

        if (deck.cards.length != updatedCards.length) {
          debugPrint('Error: Card not found');
          return false;
        }

        deck = deck.copyWith(cards: updatedCards);
        rootFolder = replaceDeck(rootFolder, deck);

        await saveRootFolder(rootFolder);

        debugPrint(deck.cards.toString());

        return true;
      } else {
        debugPrint('Error: Deck not found');
        return false;
      }
    } catch (e) {
      debugPrint('Error editing card: $e');
      return false;
    }
  }
}
