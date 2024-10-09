import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/local/data_service.dart';
import 'package:flutter_flash_card/domain/model/folder.dart';

class FolderListModel extends ChangeNotifier {
  final DataService _dataService;
  final TextEditingController folderNameController = TextEditingController();

  List<Folder> _folders = [];

  List<Folder> get folders => _folders;

  List<bool> _isLongPressed = [];

  List<bool> get isLongPressed => _isLongPressed;

  FolderListModel({
    required DataService dataService,
  }) : _dataService = dataService {
    loadFolders();
  }

  Future<void> loadFolders() async {
    final rootFolder = await _dataService.loadRootFolder();

    debugPrint(rootFolder.toString());

    _folders = [...rootFolder.subFolders];

    _isLongPressed = List.filled(_folders.length, false);

    notifyListeners();

    debugPrint(folders.toString());
  }

  Future<void> createFolder() async {
    final folderName = folderNameController.text.trim();

    if (folderName == '') {
      return;
    }

    try {
      Folder rootFolder = await _dataService.loadRootFolder();

      rootFolder = _dataService.addFolder(rootFolder, folderName);

      await _dataService.saveRootFolder(rootFolder);

      _folders = [...rootFolder.subFolders];
      _isLongPressed = List.filled(_folders.length, false);

      folderNameController.clear();

      notifyListeners();
    } catch (e) {
      debugPrint('Error : $e');
    }
  }

  void showHiddenButtons(int index) {
    _isLongPressed[index] = !_isLongPressed[index];
    notifyListeners();
  }

  @override
  void dispose() {
    folderNameController.dispose();
    super.dispose();
  }
}
