import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/local/data_service.dart';
import 'package:flutter_flash_card/domain/model/deck.dart';

class DeckModel extends ChangeNotifier {
  final Deck deckData;
  final DataService _dataService;

  final TextEditingController cardFrontController = TextEditingController();
  final TextEditingController cardBackController = TextEditingController();

  List<Card> _cards = [];

  List<Card> get cards => _cards;

  DeckModel({
    required this.deckData,
    required DataService dataService,
  }) : _dataService = dataService {
    loadCards();
  }

  Future<void> loadCards() async {
    _cards = List.from(deckData.cards);
  }

  Future<void> createCard() async {
    final cardFrontText = cardFrontController.text.trim();
    final cardBackText = cardBackController.text.trim();

    _dataService.addCard(deckData, cardFrontText, cardBackText);
  }

  @override
  void dispose() {
    cardFrontController.dispose();
    cardBackController.dispose();
    super.dispose();
  }
}
