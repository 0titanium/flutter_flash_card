import 'package:flutter/material.dart';
import 'package:flutter_flash_card/domain/model/learning_card.dart';

class ViewCardModel extends ChangeNotifier {
  final List<LearningCard> cardsData;
  List<LearningCard> _cards = [];

  List<LearningCard> get cards => _cards;

  ViewCardModel({required this.cardsData}) {
    loadCards();
  }

  void loadCards() {
    _cards = List.from(cardsData);
    notifyListeners();
  }
}
