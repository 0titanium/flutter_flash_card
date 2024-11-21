import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/local/data_service.dart';
import 'package:flutter_flash_card/domain/model/deck.dart';
import 'package:flutter_flash_card/domain/model/folder.dart';

class FolderModel extends ChangeNotifier {
  final Folder folderData;
  final DataService _dataService;
  final TextEditingController deckNameController = TextEditingController();

  final Map<String, TextEditingController> _editDeckControllers = {};

  List<Deck> _decks = [];

  List<bool> _isLongPressed = [];

  List<bool> _isEditing = [];

  bool _isShowAll = false;

  List<Deck> get decks => _decks;

  List<bool> get isLongPressed => _isLongPressed;

  List<bool> get isEditing => _isEditing;

  FolderModel({
    required this.folderData,
    required DataService dataService,
  }) : _dataService = dataService {
    loadDecks();
  }

  TextEditingController getEditDeckController(String deckId) {
    if (!_editDeckControllers.containsKey(deckId)) {
      final deck = _decks.firstWhere((deck) => deck.id == deckId);
      _editDeckControllers[deckId] = TextEditingController(text: deck.deckName);
    }

    return _editDeckControllers[deckId]!;
  }

  Future<void> loadDecks() async {
    final folderId = folderData.id;
    final rootFolder = await _dataService.loadRootFolder();
    final nowFolder = _dataService.findFolder(rootFolder, folderId);

    if (nowFolder != null) {
      _decks = List.from(nowFolder.decks);
      debugPrint(_decks.toString());
      _isLongPressed = List.filled(_decks.length, false);
      _isEditing = List.filled(_decks.length, false);
      _dataService.saveVisitedFolders(nowFolder);
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
    final deckNameController = _editDeckControllers[deckId];

    if (deckNameController == null) {
      return;
    }

    final newDeckName = deckNameController.text.trim();

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

          _isEditing[deckIndex] = false;

          deckNameController.dispose();

          _editDeckControllers.remove(deckId);

          debugPrint('Deck edited: ${_decks[deckIndex]}');
        }
      } else {
        debugPrint('Deck not found in local list');
      }
      notifyListeners();
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
        if (_editDeckControllers.containsKey(deckId)) {
          _editDeckControllers[deckId]!.dispose();
          _editDeckControllers.remove(deckId);
        }

        _decks.removeWhere((deck) => deck.id == deckId);
        _isLongPressed = _isLongPressed.sublist(0, _decks.length);
        _isEditing = _isEditing.sublist(0, _decks.length);

        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error : $e');
    }
  }

  void showAllHiddenButtons() {
    _isShowAll = !_isShowAll;
    _isEditing = List.filled(_decks.length, _isShowAll);

    notifyListeners();
  }

  void showHiddenButtons(int index) {
    _isLongPressed[index] = !_isLongPressed[index];
    notifyListeners();
  }

  void showEditingMode(int index) {
    _isEditing[index] = !_isEditing[index];
    notifyListeners();
  }

  void _clearControllers() {
    for (final controller in _editDeckControllers.values) {
      controller.dispose();
    }

    _editDeckControllers.clear();
  }

  @override
  void dispose() {
    deckNameController.dispose();
    _clearControllers();
    super.dispose();
  }
}
