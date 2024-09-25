import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/local/data_service.dart';
import 'package:flutter_flash_card/domain/model/deck.dart';

class DeckModel extends ChangeNotifier {
  final List<dynamic> data;
  final DataService _dataService;
  List<Deck> _deckData = [];

  final TextEditingController cardFrontController = TextEditingController();
  final TextEditingController cardBackController = TextEditingController();

  List<Card> _cards = [];

  List<Card> get cards => _cards;

  DeckModel({
    required this.data,
    required DataService dataService,
  }) : _dataService = dataService {
    loadCards();
  }

  Future<void> loadCards() async {
  }

  Future<void> createCard() async {}

}
