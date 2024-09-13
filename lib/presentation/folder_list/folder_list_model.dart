import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/local/data_service.dart';
import 'package:flutter_flash_card/domain/model/folder.dart';

class FolderListModel extends ChangeNotifier {
  final DataService _dataService;

  List<Folder> folders = [];

  FolderListModel({
    required DataService dataService,
  }) : _dataService = dataService{
    loadFolders();
  }

  Future<void> loadFolders() async {
    final rootFolder = await _dataService.loadRootFolder();

    debugPrint(rootFolder.toString());

    folders = [rootFolder, ...rootFolder.subFolders];
    notifyListeners();

    debugPrint(folders.toString());
  }
}
