import 'package:flutter/material.dart';
import 'package:flutter_flash_card/domain/model/learning_card.dart';

class ReviewCardModel extends ChangeNotifier {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  final List<LearningCard> reviewCards;

  PageController get pageController => _pageController;

  ReviewCardModel({
    required this.reviewCards,
  });

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
