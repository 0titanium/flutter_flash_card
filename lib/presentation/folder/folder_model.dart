import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/local/data_service.dart';
import 'package:flutter_flash_card/domain/model/deck.dart';

class FolderModel extends ChangeNotifier {
  final List<String> folderData;
  final DataService _dataService;
  final TextEditingController deckNameController = TextEditingController();

  List<Deck> _decks = [];

  List<Deck> get decks => _decks;

  FolderModel({
    required this.folderData,
    required DataService dataService,
  }) : _dataService = dataService {
    loadDecks();
  }

  Future<void> loadDecks() async {
    final folderId = folderData[1];
    final rootFolder = await _dataService.loadRootFolder();
    final nowFolder = _dataService.findFolder(rootFolder, folderId);

    if (nowFolder != null) {
      _decks = nowFolder.decks;
    }
  }

  Future<void> createDeck() async {
    final folderId = folderData[1];
    final deckName = deckNameController.text.trim();
    final rootFolder = await _dataService.loadRootFolder();
    final nowFolder = _dataService.findFolder(rootFolder, folderId);

    if (deckName == '') {
      return;
    }

    try {
      if (nowFolder != null) {
        _dataService.addDeck(nowFolder, deckName);
      }
    } catch (e) {
      debugPrint('Error : $e');
    }
  }
}
