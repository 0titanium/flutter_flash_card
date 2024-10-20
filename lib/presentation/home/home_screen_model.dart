import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/local/data_service.dart';
import 'package:flutter_flash_card/domain/model/folder.dart';

class HomeScreenModel extends ChangeNotifier {
  final DataService _dataService;

  List<Folder> _savedFolders = [];

  List<Folder> get savedFolders => _savedFolders;

  HomeScreenModel({required DataService dataService})
      : _dataService = dataService {
    loadSavedFolderNames();
  }

  Future<void> loadSavedFolderNames() async {
    _savedFolders = await _dataService.getVisitedFolders() ?? [];
    notifyListeners();
  }
}
