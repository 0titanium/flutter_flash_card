import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/local/data_service.dart';
import 'package:flutter_flash_card/domain/model/folder.dart';

class FolderListModel extends ChangeNotifier {
  final DataService _dataService;
  final TextEditingController folderNameController = TextEditingController();

  List<Folder> _folders = [];

  List<Folder> get folders => _folders;

  FolderListModel({
    required DataService dataService,
  }) : _dataService = dataService {
    loadFolders();
  }

  Future<void> loadFolders() async {
    final rootFolder = await _dataService.loadRootFolder();

    debugPrint(rootFolder.toString());

    _folders = [...rootFolder.subFolders];
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
      notifyListeners();
    } catch (e) {
      debugPrint('Error : $e');
    }
  }

  @override
  void dispose() {
    folderNameController.dispose();
    super.dispose();
  }
}
