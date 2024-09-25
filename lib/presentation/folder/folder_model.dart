import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/local/data_service.dart';
import 'package:flutter_flash_card/domain/model/deck.dart';
import 'package:flutter_flash_card/domain/model/folder.dart';

class FolderModel extends ChangeNotifier {
  final Folder folderData;
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
    final folderId = folderData.id;
    final rootFolder = await _dataService.loadRootFolder();
    final nowFolder = _dataService.findFolder(rootFolder, folderId);

    if (nowFolder != null) {
      _decks = nowFolder.decks;
      debugPrint(_decks.toString());
      notifyListeners();
    }
  }

  Future<void> createDeck() async {
    final folderId = folderData.id;
    final deckName = deckNameController.text.trim();
    Folder rootFolder = await _dataService.loadRootFolder();

    if (deckName == '') {
      return;
    }

    try {
      Folder? nowFolder = _dataService.findFolder(rootFolder, folderId);
      if (nowFolder != null) {
        nowFolder = _dataService.addDeck(nowFolder, deckName);
        rootFolder = _dataService.replaceFolder(rootFolder, nowFolder);

        await _dataService.saveRootFolder(rootFolder);

        _decks = List.from(nowFolder.decks);

        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error : $e');
    }
  }

  @override
  void dispose() {
    deckNameController.dispose();
    super.dispose();
  }
}
