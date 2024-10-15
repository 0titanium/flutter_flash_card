import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/local/data_service.dart';
import 'package:flutter_flash_card/domain/model/deck.dart';
import 'package:flutter_flash_card/domain/model/learning_card.dart';

class DeckModel extends ChangeNotifier {
  final Deck deckData;
  final DataService _dataService;

  final TextEditingController cardFrontController = TextEditingController();
  final TextEditingController cardBackController = TextEditingController();

  TextEditingController editFrontController = TextEditingController();
  TextEditingController editBackController = TextEditingController();

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

  Future<void> loadCards() async {
    try {
      final rootFolder = await _dataService.loadRootFolder();
      final deck = _dataService.findDeck(rootFolder, deckData.id);

      if (deck != null) {
        _cards = List.from(deck.cards);

        deckDetails = {
          'cardList': _cards,
          'order': willChangeOrder,
          'deckId' : deckData.id,
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
        // deckData = updatedDeck;
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
    final editFrontText = editFrontController.text.trim();
    final editBackText = editBackController.text.trim();

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

          _isEditing = List.filled(_cards.length, false);

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
    editFrontController = TextEditingController(text: _cards[index].frontText);
    editBackController = TextEditingController(text: _cards[index].backText);
    notifyListeners();
  }

  @override
  void dispose() {
    cardFrontController.dispose();
    cardBackController.dispose();
    editFrontController.dispose();
    editBackController.dispose();

    super.dispose();
  }
}
