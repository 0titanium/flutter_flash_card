import 'package:flutter/material.dart';
import 'package:flutter_flash_card/data/local/data_service.dart';
import 'package:flutter_flash_card/domain/model/folder.dart';

class AddFolderModel extends ChangeNotifier {
  final DataService _dataService;
  // final Folder rootFolder;

  AddFolderModel({
    required DataService dataService,
  }) : _dataService = dataService{
    loadRootFolder();
  }

  final TextEditingController folderNameController = TextEditingController();

  String _folderName = '';

  Future<void> loadRootFolder() async {
    // rootFolder = await _dataService.loadRootFolder();
  }

  Future<void> makeFolder (String folderName) async {
    _folderName = folderName;

    // _dataService.addFolder(parentFolder, _folderName);
  }
}
