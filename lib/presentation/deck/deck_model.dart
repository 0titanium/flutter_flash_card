import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/local/data_service.dart';
import 'package:flutter_flash_card/domain/model/deck.dart';

class DeckModel extends ChangeNotifier {
  final DataService _dataService;
  final List<String>_deckData;

  List<Card> _cards = [];

  List<Card> get cards => _cards;

  DeckModel({required List<String> deckData, required DataService dataService})
      : _deckData = deckData,
        _dataService = dataService;
}
