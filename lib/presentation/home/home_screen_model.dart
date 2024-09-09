import 'package:flutter/material.dart';
import 'package:flutter_flash_card/presentation/card_list/card_list_screen.dart';
import 'package:flutter_flash_card/presentation/components/recent_used_card_list/recent_used_card_list.dart';
import 'package:flutter_flash_card/presentation/my_info/my_info_screen.dart';

class HomeScreenModel extends ChangeNotifier {
  int _currentPageIndex = 0;

  final List<Widget> _screens = const [
    RecentUsedCardList(),
    CardListScreen(),
    MyInfoScreen(),
  ];

  int get currentPageIndex => _currentPageIndex;

  List<Widget> get screens => _screens;

  void onIndexSelected(int index) {
    _currentPageIndex = index;

    notifyListeners();
  }
}
