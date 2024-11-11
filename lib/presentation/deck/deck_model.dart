import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/local/data_service.dart';
import 'package:flutter_flash_card/domain/model/deck.dart';
import 'package:flutter_flash_card/domain/model/learning_card.dart';

class DeckModel extends ChangeNotifier {
  final Deck deckData;
  final DataService _dataService;

  final TextEditingController cardFrontController = TextEditingController();
  final TextEditingController cardBackController = TextEditingController();

  final Map<String, TextEditingController> _editFrontControllers = {};
  final Map<String, TextEditingController> _editBackControllers = {};

  List<LearningCard> _cards = [];

  List<LearningCard> get cards => _cards;

  String inOrder = 'inOrder';

  String inRandomOrder = 'inRandomOrder';

  String willChangeOrder = '';

  Map<String, dynamic> deckDetails = {};

  List<bool> _isLongPressed = [];

  List<bool> get isLongPressed => _isLongPressed;

  List<bool> _isEditing = [];

  List<bool> get isEditing => _isEditing;

  DeckModel({
    required this.deckData,
    required DataService dataService,
  }) : _dataService = dataService {
    loadCards();
    willChangeOrder = inOrder;
  }

  TextEditingController getEditFrontController(String cardId) {
    if (!_editFrontControllers.containsKey(cardId)) {
      final card = _cards.firstWhere((card) => card.id == cardId);
      _editFrontControllers[cardId] =
          TextEditingController(text: card.frontText);
    }

    return _editFrontControllers[cardId]!;
  }

  TextEditingController getEditBackController(String cardId) {
    if (!_editBackControllers.containsKey(cardId)) {
      final card = _cards.firstWhere((card) => card.id == cardId);
      _editBackControllers[cardId] = TextEditingController(text: card.backText);
    }

    return _editBackControllers[cardId]!;
  }

  Future<void> loadCards() async {
    try {
      final rootFolder = await _dataService.loadRootFolder();
      final deck = _dataService.findDeck(rootFolder, deckData.id);

      if (deck != null) {
        _cards = List.from(deck.cards);

        _clearControllers();

        for (final card in _cards) {
          _editFrontControllers[card.id] =
              TextEditingController(text: card.frontText);
          _editBackControllers[card.id] =
              TextEditingController(text: card.backText);
        }

        deckDetails = {
          'cardList': _cards,
          'order': willChangeOrder,
          'deckId': deckData.id,
        };

        _isLongPressed = List.filled(_cards.length, false);
        _isEditing = List.filled(_cards.length, false);

        notifyListeners();
      } else {
        debugPrint('Deck not found: $deckData.id');
      }
    } catch (e) {
      debugPrint('Error loading cards: $e');
    }
  }

  Future<void> createCard() async {
    final cardFrontText = cardFrontController.text.trim();
    final cardBackText = cardBackController.text.trim();

    if (cardFrontText.isEmpty || cardBackText.isEmpty) {
      return;
    }

    try {
      final updatedDeck =
          await _dataService.addCard(deckData.id, cardFrontText, cardBackText);

      if (updatedDeck != null) {
        _cards = List.from(updatedDeck.cards);

        _isLongPressed = List.filled(_cards.length, false);
        _isEditing = List.filled(_cards.length, false);

        deckDetails['cardList'] = _cards;

        cardFrontController.clear();
        cardBackController.clear();

        notifyListeners();
      } else {
        debugPrint('Failed to add card');
      }
    } catch (e) {
      debugPrint('Error creating card: $e');
    }
  }

  Future<void> editCard(String cardId) async {
    final editFrontText = _editFrontControllers[cardId]!.text.trim();
    final editBackText = _editBackControllers[cardId]!.text.trim();

    if (editFrontText.isEmpty || editBackText.isEmpty) {
      return;
    }

    try {
      final success = await _dataService.editCard(
          deckData.id, cardId, editFrontText, editBackText);
      if (success) {
        final cardIndex = _cards.indexWhere((card) => card.id == cardId);
        if (cardIndex != -1) {
          _cards[cardIndex] = _cards[cardIndex].copyWith(
            frontText: editFrontText,
            backText: editBackText,
          );

          _isEditing[cardIndex] = false;

          deckDetails['cardList'] = _cards;

          notifyListeners();
        } else {
          debugPrint('Card not found in local list');
        }
      } else {
        debugPrint('Failed to edit card');
      }
    } catch (e) {
      debugPrint('Error editing card: $e');
    }
  }

  Future<void> deleteCard(String cardId) async {
    try {
      final success = await _dataService.deleteCard(deckData.id, cardId);
      if (success) {
        _cards.removeWhere((card) => card.id == cardId);
        _isLongPressed = _isLongPressed.sublist(0, _cards.length);
        _isEditing = _isEditing.sublist(0, _cards.length);
        deckDetails['cardList'] = _cards;

        notifyListeners();
      } else {
        debugPrint('Failed to delete card');
      }
    } catch (e) {
      debugPrint('Error deleting card: $e');
    }
  }

  void changeOrder(String? value) {
    willChangeOrder = value!;
    notifyListeners();

    deckDetails['order'] = willChangeOrder;
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
    for (final controller in _editFrontControllers.values) {
      controller.dispose();
    }
    for (final controller in _editBackControllers.values) {
      controller.dispose();
    }
    _editFrontControllers.clear();
    _editBackControllers.clear();
  }

  @override
  void dispose() {
    cardFrontController.dispose();
    cardBackController.dispose();

    _clearControllers();

    super.dispose();
  }
}
