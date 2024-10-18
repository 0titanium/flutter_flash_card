import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/local/data_service.dart';
import 'package:flutter_flash_card/presentation/folder_list/folder_list_screen.dart';
import 'package:flutter_flash_card/presentation/my_info/my_info_screen.dart';
import 'package:flutter_flash_card/presentation/recent_used_card_list/recent_used_card_list_screen.dart';

class HomeScreenModel extends ChangeNotifier {
  final DataService _dataService;

  int _currentPageIndex = 0;

  final List<Widget> _screens = const [
    RecentUsedCardListScreen(),
    FolderListScreen(),
    MyInfoScreen(),
  ];

  int get currentPageIndex => _currentPageIndex;

  List<Widget> get screens => _screens;

  List<String> _folderNames = [];

  List<String> get folderNames => _folderNames;

  HomeScreenModel({required DataService dataService})
      : _dataService = dataService {
    loadSavedFolderNames();
  }

  void onIndexSelected(int index) {
    _currentPageIndex = index;

    notifyListeners();
  }

  Future<void> loadSavedFolderNames() async {
    _folderNames = await _dataService.getVisitedFolders();
    notifyListeners();
  }
}
