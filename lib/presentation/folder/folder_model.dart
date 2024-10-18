import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/local/data_service.dart';
import 'package:flutter_flash_card/domain/model/deck.dart';
import 'package:flutter_flash_card/domain/model/folder.dart';

class FolderModel extends ChangeNotifier {
  final Folder folderData;
  final DataService _dataService;
  final TextEditingController deckNameController = TextEditingController();
  TextEditingController editDeckController = TextEditingController();

  List<Deck> _decks = [];

  List<Deck> get decks => _decks;

  List<bool> _isLongPressed = [];

  List<bool> get isLongPressed => _isLongPressed;

  List<bool> _isEditing = [];

  List<bool> get isEditing => _isEditing;

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
      _isLongPressed = List.filled(_decks.length, false);
      _isEditing = List.filled(_decks.length, false);
      _dataService.saveVisitedFolders(folderData.name);
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
        _isLongPressed = List.filled(_decks.length, false);
        _isEditing = List.filled(_decks.length, false);

        deckNameController.clear();

        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error : $e');
    }
  }

  Future<void> editDeckName(String deckId) async {
    final newDeckName = editDeckController.text.trim();

    if (newDeckName.isEmpty) {
      return;
    }

    try {
      final success = await _dataService.editDeckName(deckId, newDeckName);

      if (success) {
        final deckIndex = _decks.indexWhere((deck) => deck.id == deckId);
        if (deckIndex != -1) {
          _decks[deckIndex] = _decks[deckIndex].copyWith(
            deckName: newDeckName,
          );

          _isEditing = List.filled(_decks.length, false);
          debugPrint('Deck edited: ${_decks[deckIndex]}');

          notifyListeners();
        }
      } else {
        debugPrint('Deck not found in local list');
      }
    } catch (e) {
      debugPrint('Error : $e');
    }
  }

  Future<void> deleteDeck(String deckId) async {
    final folderId = folderData.id;
    Folder rootFolder = await _dataService.loadRootFolder();

    try {
      _dataService.deleteDeck(deckId);

      Folder? nowFolder = _dataService.findFolder(rootFolder, folderId);

      if (nowFolder != null) {
        _decks = List.from(nowFolder.decks);
        _isLongPressed = _isLongPressed.sublist(0, _decks.length);
        _isEditing = _isEditing.sublist(0, _decks.length);

        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error : $e');
    }
  }

  void showHiddenButtons(int index) {
    _isLongPressed[index] = !_isLongPressed[index];
    notifyListeners();
  }

  void showEditingMode(int index) {
    _isEditing[index] = !_isEditing[index];
    editDeckController = TextEditingController(text: _decks[index].deckName);
    notifyListeners();
  }

  @override
  void dispose() {
    deckNameController.dispose();
    editDeckController.dispose();
    super.dispose();
  }
}
