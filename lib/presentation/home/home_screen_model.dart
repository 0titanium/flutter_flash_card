import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/local/data_service.dart';
import 'package:flutter_flash_card/domain/model/folder.dart';

class HomeScreenModel extends ChangeNotifier {
  final DataService _dataService;

  List<Folder> _savedFolders = [];

  List<bool> _isEditing = [];

  bool _isShowAll = false;

  List<bool> get isEditing => _isEditing;

  List<Folder> get savedFolders => _savedFolders;

  HomeScreenModel({required DataService dataService})
      : _dataService = dataService {
    loadSavedFolderNames();
  }

  Future<void> loadSavedFolderNames() async {
    _savedFolders = (await _dataService.getVisitedFolders());

    _isEditing = List.filled(_savedFolders.length, false);

    notifyListeners();
  }

  Future<void> deleteVisitedFolder(Folder folder) async {
    try {
      await _dataService.deleteSavedFolder(folder);

      loadSavedFolderNames();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void showAllHiddenButtons() {
    _isShowAll = !_isShowAll;
    _isEditing = List.filled(_savedFolders.length, _isShowAll);

    notifyListeners();
  }
}
