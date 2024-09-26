import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/local/data_service.dart';
import 'package:flutter_flash_card/domain/model/deck.dart';
import 'package:flutter_flash_card/domain/model/learning_card.dart';

class DeckModel extends ChangeNotifier {
  final Deck deckData;
  final DataService _dataService;

  final TextEditingController cardFrontController = TextEditingController();
  final TextEditingController cardBackController = TextEditingController();

  List<LearningCard> _cards = [];

  List<LearningCard> get cards => _cards;

  DeckModel({
    required this.deckData,
    required DataService dataService,
  }) : _dataService = dataService {
    loadCards();
  }

  Future<void> loadCards() async {
    try {
      final rootFolder = await _dataService.loadRootFolder();
      final deck = _dataService.findDeck(rootFolder, deckData.id);

      if (deck != null) {
        _cards = List.from(deck.cards);
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
        notifyListeners();

        cardFrontController.clear();
        cardBackController.clear();
      } else {
        debugPrint('Failed to add card');
      }
    } catch (e) {
      debugPrint('Error creating card: $e');
    }
  }

  @override
  void dispose() {
    cardFrontController.dispose();
    cardBackController.dispose();
    super.dispose();
  }
}
