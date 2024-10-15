import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/local/data_service.dart';
import 'package:flutter_flash_card/domain/model/learning_card.dart';

class ViewCardModel extends ChangeNotifier {
  final Map<String, dynamic> deckDetails;

  final DataService _dataService;

  final PageController _pageController = PageController(viewportFraction: 0.8);

  PageController get pageController => _pageController;

  List<LearningCard> _cards = [];

  List<LearningCard> get cards => _cards;

  List<bool> _checkedList = [];

  List<bool> get checkedList => _checkedList;

  ViewCardModel({
    required this.deckDetails,
    required DataService dataService,
  }) : _dataService = dataService {
    loadCards();
  }

  void loadCards() {
    if (deckDetails['order'] == 'inOrder') {
      _cards = List.from(deckDetails['cardList']);
    } else {
      _cards = List.from(deckDetails['cardList']);
      _cards.shuffle();
      _checkedList = List.filled(_cards.length, false);
    }
    debugPrint(_cards.toString());
    notifyListeners();
  }

  void checkIsKnown(String deckId, String cardId, bool isKnown) {
    _dataService.checkIsKnownCard(deckId, cardId, isKnown);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
